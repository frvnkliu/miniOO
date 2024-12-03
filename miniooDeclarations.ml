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

(* Pretty Printing *)
let rec pretty_print_expr = function
  | Field name -> Printf.sprintf "Field(%s)" name
  | Num value -> Printf.sprintf "Num(%d)" value
  | Minus (e1, e2) -> Printf.sprintf "Minus(%s, %s)" (pretty_print_expr e1) (pretty_print_expr e2)
  | Null -> "NULL"
  | Variable name -> Printf.sprintf "Variable(%s)" name
  | FieldAccess (e1, e2) -> Printf.sprintf "FieldAccess(%s, %s)" (pretty_print_expr e1) (pretty_print_expr e2)
  | Proc (name, command) -> Printf.sprintf "Proc(%s, %s)" name (pretty_print_cmd command)

and pretty_print_bool_expr = function
  | Bool b -> Printf.sprintf "Bool(%b)" b
  | Equals (e1, e2) -> Printf.sprintf "Equals(%s, %s)" (pretty_print_expr e1) (pretty_print_expr e2)
  | Lessthan (e1, e2) -> Printf.sprintf "Lessthan(%s, %s)" (pretty_print_expr e1) (pretty_print_expr e2)

and pretty_print_cmd = function
  | VarDecl name -> Printf.sprintf "VarDecl(%s)" name
  | ProcCall (e1, e2) -> Printf.sprintf "ProcCall(%s, %s)" (pretty_print_expr e1) (pretty_print_expr e2)
  | AssignVal (e1, e2) -> Printf.sprintf "AssignVal(%s, %s)" (pretty_print_expr e1) (pretty_print_expr e2)
  | Malloc name -> Printf.sprintf "Malloc(%s)" name
  | Skip -> "Skip"
  | Sequence commands -> Printf.sprintf "Sequence(%s)" (pretty_print_cmds commands)
  | While (b, command) -> Printf.sprintf "While(%s, %s)" (pretty_print_bool_expr b) (pretty_print_cmd command)
  | IfElse (b, cmd1, cmd2) -> Printf.sprintf "IfElse(%s, %s, %s)" (pretty_print_bool_expr b) (pretty_print_cmd cmd1) (pretty_print_cmd cmd2)
  | If (b, command) -> Printf.sprintf "If(%s, %s)" (pretty_print_bool_expr b) (pretty_print_cmd command)
  | Parallel (cmds1, cmds2) -> Printf.sprintf "Parallel(%s, %s)" (pretty_print_cmds cmds1) (pretty_print_cmds cmds2)
  | Atom commands -> Printf.sprintf "Atom(%s)" (pretty_print_cmds commands)

and pretty_print_cmds commands =
  let command_strings = List.map pretty_print_cmd commands in
  Printf.sprintf "Commands[%s]" (String.concat ", " command_strings)
(*
let rec pprrint_expr = function
  | Num(i) -> sprintf "Num(%d)" I
  | Minus(e1, e2) -> 
      "EMinus(" ^ pprrint_expr e1 ^ "," ^ pprrint_expr pprrint_expr e2 ^ ")"
  | Ident(x) -> "Ident("^x^")"
  | ProcCall(f, e) -> "ProcCall("^pprrint_expr f ^ "," ^  pprrint_expr e ^ ")"

let rec pprint_cmd = function
  | Var(x) -> "Var("^x^")"
*)

