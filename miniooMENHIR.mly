%{ (* header *)

open Ast
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
%token < string > VARIABLE, FIELD
%token < int > NUM

%start prog                   /* the entry point */
%type <unit> prog  

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
    cmds EOL    { cmds}
	
cmds :
    c = cmd SEMICOLON l = cmds                      { (CCmds(c, l)) }
    | c = cmd                                       { (c) }
    | LBRACKET cmds PARALLEL cmds RBRACKET          { () }
    | ATOM LPAREN c = cmds RPAREN                   { () }
    | SKIP                                          { () }
    | LBRACKET cmds RBRACKET                        { () }
    /* Sequential Control */
    | WHILE b = bool c = cmds                       { () }
    | IF b = bool THEN c1 = cmds ELSE c2 = cmds     { () }
    | IF b = bool c = cmds                          { () }
  
cmd :
      d = declaration           { (d) }
    | c = varassign             { (c) }
    | m = malloc                { (m) }
    | f = expr LPAREN e = expr RPAREN   { Fun(f, e) } 
    | f = fieldassign           { (f) }
    | e = expr                  { (e) }

bool :
	TRUE                             { Bool(true) }
	| FALSE                            { Bool(false) }
	| e1 = expr LEQUALS e2 = expr      { BEquals(e1, e2) }
	| e1 = expr LESSTHAN e2 = expr     { BLessthan(e1, e2) }

expr:
    f = field       { () }
    | x = VARIABLE       { (x) }
    | v = NUM         { (Num(v)) }
    | n = NULL        { () }
    /* Arithmetic */
    | e1 = expr MINUS e2 = expr       { (Minus(e1, e2)) }
    | p = proc                        { (p) }

proc:
    PROC VARIABLE ASSIGN expr            { () }

malloc: 
    MALLOC LPAREN x = VARIABLE RPAREN    { Malloc(x) }

declaration:
    VAR x = VARIABLE                     { VarDecl(x) }

field:
    f = field DOT id = VARIABLE          { Ffield(f, id) } 
    | id1 = VARIABLE DOT id2 = VARIABLE     { Field(id1, id2) } 

assign:
    x = expr ASSIGN e =expr {AssignVal(x, e)}

varassign :
    id = VARIABLE ASSIGN e = expr           { VarAssign(id, expr) }
    
fieldassign :
    e1 = expr DOT e2 =expr ASSIGN e3 = expr        { (FieldAssign(e1, e2, e3)) }

%% (* trailer *)