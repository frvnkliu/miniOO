open state

type expr = 
| Field of string
| Num of int
| Minus of expr * expr
| NULL
| Variable of string
| FieldAccess of expr * expr
| Proc of string * expr

type bool_expr = 
| Bool of bool
| Equals of expr * expr
| Lessthan of expr * expr

type cmd = 
  | VarDecl of string 
  | AssignVal of expr * expr
  | Malloc of string
  | FieldAssign of expr * expr * expr
  | CExpr of expr
  | Skip
  | Sequence of cmds
  | While of bool * cmd
  | IfElse of bool * cmd * cmd
  | If of bool * cmd
  | Parallel of cmds * cmds
  | Atom of cmds

type cmds =
  | cmd list

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

