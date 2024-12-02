{
	open miniooMENHIR
	exception EoF
}
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
  | "var"	   { VAR }
  | "atom"     { ATOM }
  | "null"     { NULL }
  | "proc"     { PROC }
  | "malloc"   { MALLOC }
  | (['a'-'z'] | ['A'-'Z'])(['a'-'z'] | ['A'-'Z'] | ['0'-'9'])* as idt
               { IDENT idt }
  | ['0'-'9']+ as num
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
