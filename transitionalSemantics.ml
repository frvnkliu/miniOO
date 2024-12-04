(* File staticSemantics.ml *)
open MiniooDeclarations
exception transitionError of string

type symbTable = (string * int) list;;

let heap : (int, symbTable) Hashtbl.t = Hashtbl.create 10;;

(*How the fuck do i do this*)

(* Shared variable stack as a reference to a list *)
let stack = ref ([] : (string*int) list);;

(*Visible Global Variables*)
let varStack = ref([] : (string*int) list);; 

(* Printing functions *)
let print_stack () = 
print_string "Stack: ";
match !stack with
  | [] -> Printf.printf "Empty\n"
  | contents ->
      List.iter
        (fun (name, value) -> Printf.printf "(%s, %d) " name value)
        contents;
      Printf.printf "\n"
;;  
(* Define as a function *)
let print_heap () = print_string "hi, I am heap :P\n";;    (* Define as a function *)

let print_state () =
  print_endline "\n===State at end of program===";
  print_stack ();  (* Call the stack printing function *)
  print_heap ();;    (* Call the heap printing function *)

(*finds, reserves, then returns a currently unused location*)
let allocate_location() = -1;;

(* Returns boolean value representing scoping errors or not*)
(*References to lists, every time a new scope is created make a copy*)
let rec check_static_expr v= function
| Field name -> false
| Num value -> false
| Minus (e1, e2) -> (check_static_expr v e1) || (check_static_expr v e2)
| Null -> false
| Variable name -> Bool.not (List.mem_assoc name !v)
| FieldAccess (e1, e2) -> (check_static_expr v e1) || (check_static_expr v e2)
| Proc (name, command) -> check_static_cmd (ref((name, -1)::!v)) command 

and check_static_bool_expr v = function
| Bool b -> false
| Equals (e1, e2) -> (check_static_expr v e1) || (check_static_expr v e2)
| Lessthan (e1, e2) -> (check_static_expr v e1) || (check_static_expr v e2)

and check_static_cmd v = function
| VarDecl name -> v := (name, -1) :: !v; false
| ProcCall (f, y) -> (check_static_expr v f) || (check_static_expr v y)
| AssignVal (e1, e2) -> (check_static_expr v e1) || (check_static_expr v e2)
| Malloc name -> Bool.not (List.mem_assoc name !v)
| Skip -> false
| Sequence commands -> check_static_cmds v commands
| While (b, command) -> (check_static_bool_expr v b) || (check_static_cmd (ref(!v)) command)
| IfElse (b, cmd1, cmd2) -> (check_static_bool_expr v b) || (check_static_cmd (ref(!v)) cmd1) ||  (check_static_cmd (ref(!v)) cmd2)
| If (b, command) -> (check_static_bool_expr v b) || (check_static_cmd (ref(!v)) command)
| Parallel (cmds1, cmds2) -> (check_static_cmds (ref(!v)) cmds1) ||  (check_static_cmds (ref(!v)) cmds2)
| Atom commands -> check_static_cmds v commands

and check_static_cmds v = function
  | [] -> false
  | cmd :: cmds -> (check_static_cmd v cmd) || (check_static_cmds v cmds)

let check_static_semantic_errors commands =
  if check_static_cmds varStack commands then
    raise (StaticError "ScopingError");;