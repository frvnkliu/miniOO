(* File staticSemantics.ml *)
open MiniooDeclarations
exception StaticError of string

(*How the fuck do i do this*)

(* Helper function to raise an error if a variable is not in scope *)
  let ensure_in_scope stack name =
    if not (Hashtbl.mem stack name) then
      raise (StaticError ("Scoping Error: Variable " ^ name ^ " is not in scope"))
  
  (* Expression checking *)
  let rec check_static_expr stack = function
    | Variable name -> ensure_in_scope stack name
    | Minus (e1, e2) ->
        check_static_expr stack e1;
        check_static_expr stack e2
    | FieldAccess (e1, e2) ->
        check_static_expr stack e1;
        check_static_expr stack e2
    | Proc (name, command) ->
        let new_stack = Hashtbl.copy stack in
        Hashtbl.replace new_stack name (-1); (* Add procedure to the new scope *)
        check_static_cmd new_stack command
    | _ -> () (* Catch-all for cases that do nothing *)
  
  (* Boolean expression checking *)
  and check_static_bool_expr stack = function
    | Equals (e1, e2) ->
        check_static_expr stack e1;
        check_static_expr stack e2
    | Lessthan (e1, e2) ->
        check_static_expr stack e1;
        check_static_expr stack e2
    | _ -> () (* Catch-all for cases that do nothing *)
  
  (* Command checking *)
  and check_static_cmd stack = function
    | VarDecl name ->
        Hashtbl.replace stack name (-1) (* Declare variable in the current scope *)
    | ProcCall (f, y) ->
        check_static_expr stack f;
        check_static_expr stack y
    | AssignVal (e1, e2) ->
        check_static_expr stack e1;
        check_static_expr stack e2
    | Malloc name ->
        ensure_in_scope stack name
    | Sequence commands -> check_static_cmds stack commands
    | While (b, command) ->
        check_static_bool_expr stack b;
        check_static_cmd (Hashtbl.copy stack) command
    | IfElse (b, cmd1, cmd2) ->
        check_static_bool_expr stack b;
        check_static_cmd (Hashtbl.copy stack) cmd1;
        check_static_cmd (Hashtbl.copy stack) cmd2
    | If (b, command) ->
        check_static_bool_expr stack b;
        check_static_cmd (Hashtbl.copy stack) command
    | Parallel (cmds1, cmds2) ->
        check_static_cmds (Hashtbl.copy stack) cmds1;
        check_static_cmds (Hashtbl.copy stack) cmds2
    | Atom commands -> check_static_cmds stack commands
    | _ -> () (* Catch-all for cases that do nothing *)
  
  (* List of commands checking *)
  and check_static_cmds stack = function
    | [] -> () (* No error for an empty list of commands *)
    | cmd :: cmds ->
        check_static_cmd stack cmd;
        check_static_cmds stack cmds
  
  (* Main function to check for static semantic errors *)
  let check_static_semantic_errors stack commands =
    check_static_cmds (Hashtbl.copy stack) commands
