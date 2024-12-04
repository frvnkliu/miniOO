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

(* Transitional Type Declarations*)
type stack = (string*int) list;;

type closure = (Variable * cmds * stack);;

type heap = Hashtbl;;
