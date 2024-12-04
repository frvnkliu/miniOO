
(* The type of tokens. *)

type token = 
  | WHILE
  | VARIABLE of ( string )
  | VAR
  | THEN
  | SKIP
  | SEMICOLON
  | RPAREN
  | RBRACKET
  | PROC
  | PARALLEL
  | NUM of ( int )
  | NULL
  | MINUS
  | MALLOC
  | LPAREN
  | LESSTHAN
  | LEQUALS
  | LBRACKET
  | IF
  | FIELD of ( string )
  | EOL
  | EOF
  | ELSE
  | DOT
  | COLON
  | BOOL of ( bool )
  | ATOM
  | ASSIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (MiniooDeclarations.cmds)
