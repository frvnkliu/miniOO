(* File transitionalSemantics.ml *)

open MiniooDeclarations
open TransitionDeclarations
exception TransitionError of string

(*Why did I do this so late*)

(* Sets a field in the heap at a given location *)
let setField heap l field value = 
  let table = Array.get !heap l in
  Hashtbl.replace table field value

(* Finds, reserves, and returns a currently unused location *)
let allocate_location heap = 
  let l = Array.length !heap in
  heap := Array.append !heap [| Hashtbl.create 5 |];
  l

(* Declares a variable by allocating a location and updating the stack *)
let declareVar name stack heap = 
  let l = allocate_location heap in
  setField heap l "val" VNull;
  Hashtbl.replace stack name l

(* Evaluates expressions *)
let rec eval_expr stack heap = function
  | Field name -> VField name
  | Num value -> VInt value
  | Minus (e1, e2) ->
      (match eval_expr stack heap e1, eval_expr stack heap e2 with
       | VInt v1, VInt v2 -> VInt (v1 - v2)
       | _ -> Error "Minus: Operands must be integers")
  | Null -> VNull
  | Variable name ->
      (try
         let loc = Hashtbl.find stack name in
         let table = Array.get !heap loc in
         Hashtbl.find table "val"
       with Not_found -> Error ("Variable " ^ name ^ " not found"))
  | FieldAccess (e1, e2) -> Error "FieldAccess not implemented"
  | Proc (name, command) -> Error "Proc not implemented"

and eval_bool_expr stack heap = function
  | Bool b -> b
  | Equals (e1, e2) ->
      (match eval_expr stack heap e1, eval_expr stack heap e2 with
       | VInt v1, VInt v2 -> v1 = v2
       | _ -> raise (TransitionError "Equals: Operands must be integers"))
  | Lessthan (e1, e2) ->
      (match eval_expr stack heap e1, eval_expr stack heap e2 with
       | VInt v1, VInt v2 -> v1 < v2
       | _ -> raise (TransitionError "Lessthan: Operands must be integers"))

(* Evaluates commands *)
and eval_cmd stack heap = function
| VarDecl name -> declareVar name stack heap
| ProcCall (f, y) -> raise (TransitionError "ProcCall not implemented")
| AssignVal (e1, e2) -> raise (TransitionError "AssignVal not implemented")
| Malloc name -> declareVar name stack heap
| Skip -> () (* No operation *)
| Sequence commands -> eval_cmds stack heap commands
| While (b, command) -> raise (TransitionError "While not implemented")
| IfElse (b, cmd1, cmd2) -> raise (TransitionError "IfElse not implemented")
| If (b, command) -> raise (TransitionError "If not implemented")
| Parallel (cmds1, cmds2) -> raise (TransitionError "Parallel not implemented")
| Atom commands -> eval_cmds stack heap commands

(* Evaluates a list of commands *)
and eval_cmds stack heap = function
  | [] -> () (* No commands left to evaluate *)
  | cmd :: cmds -> 
      eval_cmd stack heap cmd; (* Evaluate the first command *)
      eval_cmds stack heap cmds (* Recursively evaluate the rest *)

(* Exposed function to evaluate a list of commands *)
let eval_commands stack heap commands = 
  eval_cmds stack heap commands