(* File transitionalSemantics.ml *)

open MiniooDeclarations
open TransitionDeclarations
exception TransitionError of string

(*Why did I do this so late*)

(* Sets a field in the heap at a given location *)
let set_field heap l field value = 
  let table = Array.get !heap l in
  Hashtbl.replace table field value

let get_field heap l field =
  let table = Array.get !heap l in
  match Hashtbl.find_opt table field with
  | Some value -> value
  | None -> VNull

(* Finds, reserves, and returns a currently unused location *)
let allocate_location heap = 
  let l = Array.length !heap in
  heap := Array.append !heap [| Hashtbl.create 5 |];
  l

(* Declares a variable by allocating a location and updating the stack *)
let declare_var stack heap name = 
  let l = allocate_location heap in
  set_field heap l "val" VNull;
  Hashtbl.replace stack name l

let get_var_val stack heap name  =
  let l = Hashtbl.find stack name(*Guaranteed to be in our stack given staticSemantics checking*)
  in get_field heap l "val"

let set_var_val stack heap name value =
  let l = Hashtbl.find stack name(*Guaranteed to be in our stack given staticSemantics checking*)
  in set_field heap l "val" value;
  print_endline (Printf.sprintf "val %s = %s" name (pretty_print_tainted_value value))

(* creates a new Object by allocation a location and updating the stack *)
let mallocVar name stack heap = Hashtbl.replace stack name (allocate_location heap)

(* Get Field parent location*)

(* Evaluates expressions: Returns Tainted Value *)
let rec eval_loc_expr stack heap = function
  | Variable name -> VLoc(Hashtbl.find stack name) (* Guaranteed to be in our stack given staticSemantics checking *)
  | expr ->
    (match eval_expr stack heap expr with
      | VLoc loc -> VLoc(loc)
      | v -> raise (TransitionError (Printf.sprintf"Invalid Object %s"(pretty_print_tainted_value v)) )
    )

and eval_expr stack heap = function
  | Field name -> VField name
  | Num value -> VInt value
  | Minus (e1, e2) ->
      (match eval_expr stack heap e1, eval_expr stack heap e2 with
       | VInt v1, VInt v2 -> VInt (v1 - v2)
       | v1, v2 -> raise (TransitionError (Printf.sprintf "Minus: Operands must be integers: %s - %s" (pretty_print_tainted_value v1) (pretty_print_tainted_value v2)) )
      )
  | Null -> VNull
  | Variable name -> get_var_val stack heap name
  | FieldAccess (e1, e2) -> 
    (match eval_loc_expr stack heap e1, eval_expr stack heap e2 with
     |VLoc l, VField y -> get_field heap l y
     | _ -> raise (TransitionError  "Field Access: Invalid")
    )
  (*Procedures*)
  | Proc (name, command) -> VClosure(name, command, Hashtbl.copy stack)
(* Evalutates boolean expressions: Returns am OCaml bool value*)
and eval_bool_expr stack heap = function 
  | Bool b -> b
  | Equals (e1, e2) ->
      (match eval_expr stack heap e1, eval_expr stack heap e2 with
       | VInt v1, VInt v2 -> v1 = v2
       | VNull, VNull -> true
       | VLoc l1, VLoc l2 -> l1 = l2
       | VField f1, VField f2 -> f1 = f2
       | VClosure clos1, VClosure clos2 -> compare_closure clos1 clos2
       | v1, v2 -> raise (TransitionError (Printf.sprintf"Equals: Operands must be of the same type %s %s"(pretty_print_tainted_value v1) (pretty_print_tainted_value v2)) )
      )
  | Lessthan (e1, e2) ->
      (match eval_expr stack heap e1, eval_expr stack heap e2 with
       | VInt v1, VInt v2 -> v1 < v2
       | v1, v2 -> raise (TransitionError (Printf.sprintf "Lessthan: Operands must be integers: %s < %s" (pretty_print_tainted_value v1) (pretty_print_tainted_value v2)) )
      )

(* Evaluates commands *)
and eval_cmd stack heap = function
| VarDecl name -> declare_var stack heap name
| ProcCall (f, y) -> 
  (match eval_expr stack heap f with
    |VClosure(name, cmd, s) -> 
      let new_stack = Hashtbl.copy s in
      declare_var new_stack heap name;
      set_var_val new_stack heap name (eval_expr stack heap y);
      eval_cmd new_stack heap cmd 
    |v -> print_endline (Printf.sprintf "Procedure Call: %s is not a closure" (pretty_print_tainted_value v))
  )
(*Variable Assignments*)
| AssignVal (e1, e2) -> 
  let v = eval_expr stack heap e2 in
  ( match e1 with
    (*Field Assignments*)
    | FieldAccess (obj, f) -> 
      ( match eval_loc_expr stack heap obj, eval_expr stack heap f with
        | VLoc l, VField f -> set_field heap l f v
        | _ -> raise (TransitionError "Invalid Field Assignment Target")
      )
    (* Variable Assignments*)
    | Variable x -> set_var_val stack heap x v
    (* Invalid Assignments*)
    | _ -> raise (TransitionError "Invalid Assignment Target")
  )
| Malloc name -> mallocVar name stack heap
| Skip -> () (* No operation *)
| Sequence commands -> eval_cmds stack heap commands
| While (b, command) ->
    while (eval_bool_expr stack heap b) do
      eval_cmd (Hashtbl.copy stack) heap command
    done
| IfElse (b, cmd1, cmd2) -> 
    if eval_bool_expr stack heap b 
      then eval_cmd (Hashtbl.copy stack) heap cmd1
      else eval_cmd (Hashtbl.copy stack) heap cmd2
| If (b, command) -> 
    if eval_bool_expr stack heap b then eval_cmd (Hashtbl.copy stack) heap command 
| Parallel (cmds1, cmds2) ->(
    (* Randomly pick a number: 1 or 2 *)
    let first = if Random.int 2 = 0 then 1 else 2 in
    try
      (* Run the first chosen command *)
      if first = 1 then (
        eval_cmds stack heap cmds1;
        eval_cmds stack heap cmds2 (* Run the second command after the first *)
      ) else (
        eval_cmds stack heap cmds2;
        eval_cmds stack heap cmds1 (* Run the second command after the first *)
      )
    with
    | TransitionError msg ->
        (* Catch the error and continue running the second command *)
        (try
           if first = 1 then eval_cmds stack heap cmds2
           else eval_cmds stack heap cmds1
         with
         | TransitionError second_msg ->
             (* Raise a combined error if both commands fail *)
             raise (TransitionError (msg ^ " AND " ^ second_msg)));
        (* Re-raise the first error if the second succeeds *)
        raise (TransitionError msg)
      )
| Atom commands -> eval_cmds stack heap commands (*Simply run it sequentially*)

(* Evaluates a list of commands *)
and eval_cmds stack heap = function
  | [] -> () (* No commands left to evaluate *)
  | cmd :: cmds -> 
    eval_cmd stack heap cmd; (* Evaluate the first command *)
    eval_cmds stack heap cmds (* Recursively evaluate the rest *)

(* Exposed function to evaluate a list of commands *)
let eval_commands stack heap commands = 
  eval_cmds stack heap commands