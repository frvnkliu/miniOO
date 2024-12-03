{
	open miniooMENHIR
	exception EoF
}

let letter = ['a'-'z'] | ['A'-'Z']
let digit = ['0'-'9']

rule token = parse
    [' ' '\t'] { token lexbuf } (* skip blanks and tabs *)
  | ['\n' ]    { EOL }
  | "skip"     { SKIP }
  | "true"     { TRUE }
  | "false"    { FALSE }
  | "if"       { IF }
  | "then"     { THEN }
  | "else"     { ELSE }
  | "while"    { WHILE }
  | "var"	     { VAR }
  | "atom"     { ATOM }
  | "null"     { NULL }
  | "proc"     { PROC }
  | "malloc"   { MALLOC }
  | ['A'-'Z'](letter|digit)* as idt
               { IDENT idt }
  | ['a'-'z'](letter|digit)* as idt
               { FIELD idt }
  | digit+ as num
               { NUM (int_of_string num) }
  | ';'        { SEMICOLON }
  | "|||"	   { PARALLEL }
  | "=="       { LEQUALS }
  | ':' '='    { ASSIGN }
  | '-'        { MINUS }
  | '.'        { DOT }
  | '<'        { LESSTHAN }
  | '('        { LPAREN }
  | ')'        { RPAREN }
  | '{'        { LBRACKET }
  | '}'        { RBRACKET }
  | eof        { raise Eof }
