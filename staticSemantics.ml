(* File staticSemantics.ml *)
open MiniooDeclarations
exception StaticError of string

(*How the fuck do i do this*)

(* Returns boolean value representing scoping errors or not*)
(*References to lists, every time a new scope is created make a copy*)
let rec check_static_expr v = function
  | Field name -> "" (* No error for fields *)
  | Num value -> "" (* No error for numbers *)
  | Minus (e1, e2) -> 
      let err1 = check_static_expr v e1 in
      if err1 <> "" then err1
      else check_static_expr v e2
  | Null -> "" (* No error for null *)
  | Variable name -> 
      if List.mem_assoc name !v then "" 
      else name (* Return the name if it's not in scope *)
  | FieldAccess (e1, e2) -> 
      let err1 = check_static_expr v e1 in
      if err1 <> "" then err1
      else check_static_expr v e2
  | Proc (name, command) -> 
      check_static_cmd (ref ((name, -1) :: !v)) command

and check_static_bool_expr v = function
  | Bool b -> "" (* No error for boolean literals *)
  | Equals (e1, e2) -> 
      let err1 = check_static_expr v e1 in
      if err1 <> "" then err1
      else check_static_expr v e2
  | Lessthan (e1, e2) -> 
      let err1 = check_static_expr v e1 in
      if err1 <> "" then err1
      else check_static_expr v e2

and check_static_cmd v = function
  | VarDecl name -> v := (name, -1) :: !v; "" (* Declare variable, no error *)
  | ProcCall (f, y) -> 
      let err1 = check_static_expr v f in
      if err1 <> "" then err1
      else check_static_expr v y
  | AssignVal (e1, e2) -> 
      let err1 = check_static_expr v e1 in
      if err1 <> "" then err1
      else check_static_expr v e2
  | Malloc name -> 
      if List.mem_assoc name !v then "" 
      else name (* Return the name if it's not in scope *)
  | Skip -> "" (* No error for skip *)
  | Sequence commands -> check_static_cmds v commands
  | While (b, command) -> 
      let err1 = check_static_bool_expr v b in
      if err1 <> "" then err1
      else check_static_cmd (ref (!v)) command
  | IfElse (b, cmd1, cmd2) -> 
      let err1 = check_static_bool_expr v b in
      if err1 <> "" then err1
      else
        let err2 = check_static_cmd (ref (!v)) cmd1 in
        if err2 <> "" then err2
        else check_static_cmd (ref (!v)) cmd2
  | If (b, command) -> 
      let err1 = check_static_bool_expr v b in
      if err1 <> "" then err1
      else check_static_cmd (ref (!v)) command
  | Parallel (cmds1, cmds2) -> 
      let err1 = check_static_cmds (ref (!v)) cmds1 in
      if err1 <> "" then err1
      else check_static_cmds (ref (!v)) cmds2
  | Atom commands -> check_static_cmds v commands

and check_static_cmds v = function
  | [] -> "" (* No error for an empty list of commands *)
  | cmd :: cmds -> 
      let err = check_static_cmd v cmd in
      if err <> "" then err
      else check_static_cmds v cmds

let check_static_semantic_errors stack commands =
  let scoping = check_static_cmds (ref stack) commands in
  if scoping <> "" then
    raise (StaticError ("Scoping Error: " ^ scoping))