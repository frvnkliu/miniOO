open state

type expr = 
| Num of int
| Minus of expr * expr
| Proc of string * expr
| Fun of expr * expr

type bool = 
| Bool of bool
| BEquals of expr * expr
| BLessthan of expr * expr

type cmd = 
  | VarDecl of string 
  | VarAssign of string * expr
  | Malloc of string
  | FieldAssign of expr * expr * expr
  | CExpr of expr

type cmds = cmd list

let rec pprrint_expr = function
  | Num(i) -> sprintf "Num(%d)" I
  | Minus(e1, e2) -> 
      "EMinus(" ^ pprrint_expr e1 ^ "," ^ pprrint_expr pprrint_expr e2 ^ ")"
  | Ident(x) -> "Ident("^x^")"
  | Fun(f, e) -> "Fun("^pprrint_expr f ^ "," ^  pprrint_expr e ^ ")"
  

let rec pprint_cmd = function
  | Var(x) -> "Var("^x^")"


