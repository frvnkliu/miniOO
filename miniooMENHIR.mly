%{ (* header *)

open Ast
open state

%} /* declarations */

/* lexer tokens */
%token EOL SEMICOLON ASSIGN MALLOC
%token SKIP IF ELSE THEN WHILE
%token VAR
%token ATOM NULL PROC PARALLEL
%token LESSTHAN LEQUALS
%token MINUS DOT 
%token LPAREN RPAREN LBRACKET RBRACKET
%token < string > VARIABLE, FIELD
%token < int > NUM
%token < bool > BOOL

%start prog                   /* the entry point */
%type <cmds> prog  
%type <cmds> cmds
%type <cmd> cmd
%type <bool> bool_expr
%type <unit> expr

%right ASSIGN
%left MINUS          /* lowest precedence  */
%left DOT

%% /* rules */
prog :
    cmds EOL    { cmds}
	
cmds :
    c = cmd SEMICOLON cs = cmds                             { (c :: cs) }
    | c = cmd                                               { ([c]) }
  
cmd :
    VAR x = VARIABLE                        { VarDecl(x) }
    | f = expr LPAREN e = expr RPAREN       { ProcCall(f, e) } 
     /* Combined var assign and field assign */
    | x = expr ASSIGN e = expr              { AssignVal(x, e) }
    | MALLOC LPAREN x = VARIABLE RPAREN     { Malloc(x) }
    /* Sequential Control */
    | SKIP                                  { Skip }
    | LBRACKET c = cmds RBRACKET            { Sequence(c) }
    | WHILE b = bool_expr c = cmd                        { While(b, c) }
    | IF b = bool_expr THEN c1 = cmd ELSE c2 = cmd       { IfElse(b, c1, c2) }
    | IF b = bool_expr c = cmd                           { If(b, c) }
    | LBRACKET c1 = cmd PARALLEL c2 = cmd RBRACKET  { Parallel(c1, c2) }
    | ATOM LPAREN c = cmds RPAREN           { Atom(c) }


bool_expr :
	b = BOOL                        { Bool (b) }                                   
	| e1 = expr LEQUALS e2 = expr   { Equals(e1, e2) }
	| e1 = expr LESSTHAN e2 = expr  { Lessthan(e1, e2) }

expr:
    f = FIELD                               { Field(f) }
    | n = NUM                               { Num(n) }
    | e1 = expr MINUS e2 = expr             { Minus(e1, e2) }
    | NULL                                  { Null }
    | x = VARIABLE                          { Variable(x) }
    | e1 = expr DOT e2 = expr               { FieldAccess(e1, e2) }
    | PROC x = VARIABLE ASSIGN c = cmd      { Proc(x, c) }
    
%% (* trailer *)