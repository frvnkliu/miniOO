(* Static Type Declarations*)
type expr = 
| Field of string
| Num of int
| Minus of expr * expr
| Null
| Variable of string
| FieldAccess of expr * expr
| Proc of string * cmd

and bool_expr = 
| Bool of bool
| Equals of expr * expr
| Lessthan of expr * expr

and cmd = 
  | VarDecl of string 
  | ProcCall of expr * expr
  | AssignVal of expr * expr
  | Malloc of string
  | Skip
  | Sequence of cmds
  | While of bool_expr * cmd
  | IfElse of bool_expr * cmd * cmd
  | If of bool_expr * cmd
  | Parallel of cmds * cmds
  | Atom of cmds

and cmds = cmd list

(* Pretty Printing with String Offsets *)
let rec pretty_print_expr offset = function
  | Field name -> Printf.sprintf "%sField(%s)" offset name
  | Num value -> Printf.sprintf "%sNum(%d)" offset value
  | Minus (e1, e2) -> 
      Printf.sprintf "%sMinus(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_expr (offset ^ "   ") e1)
        (pretty_print_expr (offset ^ "   ") e2)
        offset
  | Null -> Printf.sprintf "%sNULL" offset
  | Variable name -> Printf.sprintf "%sVariable(%s)" offset name
  | FieldAccess (e1, e2) -> 
      Printf.sprintf "%sFieldAccess(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_expr (offset ^ "   ") e1)
        (pretty_print_expr (offset ^ "   ") e2)
        offset
  | Proc (name, command) -> 
      Printf.sprintf "%sProc(Param(%s),\n%s\n%s)" 
        offset 
        name 
        (pretty_print_cmd (offset ^ "   ") command)
        offset

and pretty_print_bool_expr offset = function
  | Bool b -> Printf.sprintf "%sBool(%b)" offset b
  | Equals (e1, e2) -> 
      Printf.sprintf "%sEquals(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_expr (offset ^ "   ") e1)
        (pretty_print_expr (offset ^ "   ") e2)
        offset
  | Lessthan (e1, e2) -> 
      Printf.sprintf "%sLessthan(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_expr (offset ^ "   ") e1)
        (pretty_print_expr (offset ^ "   ") e2)
        offset

and pretty_print_cmd offset = function
  | VarDecl name -> Printf.sprintf "%sVarDecl(%s)" offset name
  | ProcCall (e1, e2) -> 
      Printf.sprintf "%sProcCall(\n%sProcedure:\n%s\n%sParameter Value:\n%s\n%s)" 
        (offset)
        (offset^"   ")
        (pretty_print_expr (offset ^ "   "^"   ") e1)
        (offset^"   ")
        (pretty_print_expr (offset ^ "   "^"   ") e2)
        offset
  | AssignVal (e1, e2) -> 
      Printf.sprintf "%sAssignVal(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_expr (offset ^ "   ") e1)
        (pretty_print_expr (offset ^ "   ") e2)
        offset
  | Malloc name -> Printf.sprintf "%sMalloc(%s)" offset name
  | Skip -> Printf.sprintf "%sSkip" offset
  | Sequence commands -> 
      Printf.sprintf "%sSequence(\n%s\n%s)" 
        offset 
        (pretty_print_cmds (offset ^ "   ") commands)
        offset
  | While (b, command) -> 
      Printf.sprintf "%sWhile(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_bool_expr (offset ^ "   ") b)
        (pretty_print_cmd (offset ^ "   ") command)
        offset
  | IfElse (b, cmd1, cmd2) -> 
      Printf.sprintf "%sIfElse(\n%s,\n%s,\n%s\n%s)" 
        offset
        (pretty_print_bool_expr (offset ^ "   ") b)
        (pretty_print_cmd (offset ^ "   ") cmd1)
        (pretty_print_cmd (offset ^ "   ") cmd2)
        offset
  | If (b, command) -> 
      Printf.sprintf "%sIf(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_bool_expr (offset ^ "   ") b)
        (pretty_print_cmd (offset ^ "   ") command)
        offset
  | Parallel (cmds1, cmds2) -> 
      Printf.sprintf "%sParallel(\n%s,\n%s\n%s)" 
        offset
        (pretty_print_cmds (offset ^ "   ") cmds1)
        (pretty_print_cmds (offset ^ "   ") cmds2)
        offset
  | Atom commands -> 
      Printf.sprintf "%sAtom(\n%s\n%s)" 
        offset 
        (pretty_print_cmds (offset ^ "   ") commands)
        offset

and pretty_print_cmds offset commands =
  let command_strings = List.map (pretty_print_cmd (offset ^ "   ")) commands in
  Printf.sprintf "%sCommands[\n%s\n%s]" 
    offset
    (String.concat ",\n" command_strings)
    offset
;;

(* Transitional Type Declarations *)
module TransitionDeclarations = struct
  (* Stack Type: Maps strings to integers *)
  type stack = (string, int) Hashtbl.t

  (* Closure Type: Encapsulates commands and a stack *)
  type closure = (string * cmd * stack)

  (* Tainted Value Type: Represents runtime values and errors *)
  type tainted_value =
    | VField of string
    | VInt of int
    | VLoc of int
    | VNull
    | VClosure of closure

  (* Heap Type: A hashtable mapping integers to tainted values *)
  type heap = (string, tainted_value) Hashtbl.t array

  let pretty_print_stack stack =
    let entries = Hashtbl.fold (fun key value acc ->
      Printf.sprintf "%s->%d" key value :: acc
    ) stack [] in
    Printf.sprintf "Stack: [%s]" (String.concat ", " (List.rev entries))
  (* Print a single tainted_value *)
  let pretty_print_tainted_value tv =
    match tv with
    | VField name -> Printf.sprintf "Field(%s)" name
    | VInt value -> Printf.sprintf "Int(%d)" value
    | VLoc addr -> Printf.sprintf "Loc(%d)" addr
    | VNull -> Printf.sprintf "vNull"
    | VClosure (name, cmd, s) -> Printf.sprintf "Closure(%s, %s, %s)" name (pretty_print_cmd "" cmd)  (pretty_print_stack s)
  
  let print_heap h =
    print_string "===Heap===\n";
    Array.iteri
      (fun index hashtable ->
        Printf.printf "Location %d:\n" index;
        Hashtbl.iter
          (fun key value ->
            Printf.printf "%s -> %s\n" key (pretty_print_tainted_value value))
          hashtable)
      h

  let print_stack s =
    print_endline (pretty_print_stack s)


  let rec compare_cmds cmd1 cmd2 =
    match cmd1, cmd2 with
    | VarDecl s1, VarDecl s2 -> s1 = s2
    | ProcCall (e1, e2), ProcCall (e1', e2') -> compare_exprs e1 e1' && compare_exprs e2 e2'
    | AssignVal (e1, e2), AssignVal (e1', e2') -> compare_exprs e1 e1' && compare_exprs e2 e2'
    | Malloc s1, Malloc s2 -> s1 = s2
    | Skip, Skip -> true
    | Sequence cmds1, Sequence cmds2 -> compare_cmds_list cmds1 cmds2
    | While (b1, c1), While (b2, c2) -> compare_bool_exprs b1 b2 && compare_cmds c1 c2
    | IfElse (b1, c1, c2), IfElse (b2, c3, c4) -> 
        compare_bool_exprs b1 b2 && compare_cmds c1 c3 && compare_cmds c2 c4
    | If (b1, c1), If (b2, c2) -> compare_bool_exprs b1 b2 && compare_cmds c1 c2
    | Parallel (cmds1, cmds2), Parallel (cmds3, cmds4) -> 
        compare_cmds_list cmds1 cmds3 && compare_cmds_list cmds2 cmds4
    | Atom cmds1, Atom cmds2 -> compare_cmds_list cmds1 cmds2
    | _, _ -> false (* Different constructors *)
  
  and compare_cmds_list cmds1 cmds2 =
    List.length cmds1 = List.length cmds2 && List.for_all2 compare_cmds cmds1 cmds2
  
  and compare_exprs e1 e2 =
    match e1, e2 with
    | Field s1, Field s2 -> s1 = s2
    | Num v1, Num v2 -> v1 = v2
    | Minus (e1, e2), Minus (e1', e2') -> compare_exprs e1 e1' && compare_exprs e2 e2'
    | Null, Null -> true
    | Variable s1, Variable s2 -> s1 = s2
    | FieldAccess (e1, e2), FieldAccess (e1', e2') -> compare_exprs e1 e1' && compare_exprs e2 e2'
    | Proc (s1, c1), Proc (s2, c2) -> s1 = s2 && compare_cmds c1 c2
    | _, _ -> false (* Different constructors *)
  
  and compare_bool_exprs b1 b2 =
    match b1, b2 with
    | Bool v1, Bool v2 -> v1 = v2
    | Equals (e1, e2), Equals (e1', e2') -> compare_exprs e1 e1' && compare_exprs e2 e2'
    | Lessthan (e1, e2), Lessthan (e1', e2') -> compare_exprs e1 e1' && compare_exprs e2 e2'
    | _, _ -> false (* Different constructors *)
  
  let compare_stacks s1 s2 =
    (* Ensure both stacks have the same size *)
    if Hashtbl.length s1 <> Hashtbl.length s2 then false
    else
      try
        Hashtbl.iter (fun key value ->
          match Hashtbl.find_opt s2 key with
          | Some v -> if v <> value then raise Exit
          | None -> raise Exit
        ) s1;
        true
      with Exit -> false
  
  let compare_closure (name1, cmd1, stack1) (name2, cmd2, stack2) =
    name1 = name2 && compare_cmds cmd1 cmd2 && compare_stacks stack1 stack2
end
