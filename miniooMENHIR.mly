%{ (* header *)

open minooDeclarations
open state

%} /* declarations */

/* lexer tokens */
%token EOL SEMICOLON ASSIGN MALLOC
%token SKIP IF ELSE THEN WHILE
%token TRUE FALSE
%token VAR
%token ATOM NULL PROC PARALLEL
%token LESSTHAN LEQUALS
%token MINUS DOT 
%token LPAREN RPAREN LBRACKET RBRACKET
%token < string > IDENT
%token < int > NUM

%start prog                   /* the entry point */
%type <minooDeclarations.typeProg> prog  

%type <unit> field
%type <unit> cmds
%type <unit> cmd
%type <unit> bool
%type <unit> declaration
%type <unit> varassign
%type <unit> fieldassign
%type <unit> malloc
%type <unit> expr
%type <unit> proc

%nonassoc ASSIGN
%left MINUS          /* lowest precedence  */

%% /* rules */
prog :
    cmds EOL    { print_int $1 ; print_newline(); flush stdout; ()}

expr:
  | f = field       { () }
  | x = IDENT       { () }
  | v = NUM         { () }
  | n = NULL        { () }
  /* Arithmetic */
  | e1 = expr MINUS e2 = expr       { () }
  | LPAREN e = expr RPAREN          { () }
  | p = proc                        { () }

bool :
	| TRUE                             { () }
	| FALSE                            { () }
	| e1 = expr LEQUALS e2 = expr      { () }
	| e1 = expr LESSTHAN e2 = expr     { () }
	
cmds :
    cmd SEMICOLON l = cmds                          { () }
    | c = cmd                                       { () }
    | LBRACKET cmds PARALLEL cmds RBRACKET          { () }
    | ATOM LPAREN c = cmds RPAREN                   { () }
    | SKIP                                          { () }
    | LBRACKET cmds RBRACKET                        { () }
    | WHILE b = bool c = cmds                       { () }
    | IF b = bool THEN c1 = cmds ELSE c2 = cmds     { () }
    | IF b = bool c = cmds                          { () }
  
cmd :
    declaration                 { () }
    | c = varassign             { () }
    | expr LPAREN expr RPAREN   { () } 
    | f = fieldassign           { () }
    | m = malloc                { () }
    | c = expr                  { () }
  /* Sequential Control */

proc:
    PROC IDENT ASSIGN expr           { () }

malloc: 
    MALLOC LPAREN IDENT RPAREN      { () }

declaration:
    VAR IDENT                       { () }

field:
    | f = field DOT id = IDENT          { () } 
    | id1 = IDENT DOT id2 = IDENT       { () } 

varassign :
    IDENT ASSIGN e = expr               { () }
    
fieldassign :
    f =field ASSIGN e = expr        { () }

%% (* trailer *)