
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | VARIABLE of (
# 15 "miniooMENHIR.mly"
       ( string )
# 16 "miniooMENHIR.ml"
  )
    | VAR
    | THEN
    | SKIP
    | SEMICOLON
    | RPAREN
    | RBRACKET
    | PROC
    | PARALLEL
    | NUM of (
# 16 "miniooMENHIR.mly"
       ( int )
# 29 "miniooMENHIR.ml"
  )
    | NULL
    | MINUS
    | MALLOC
    | LPAREN
    | LESSTHAN
    | LEQUALS
    | LBRACKET
    | IF
    | FIELD of (
# 15 "miniooMENHIR.mly"
       ( string )
# 42 "miniooMENHIR.ml"
  )
    | EOL
    | EOF
    | ELSE
    | DOT
    | BOOL of (
# 17 "miniooMENHIR.mly"
       ( bool )
# 51 "miniooMENHIR.ml"
  )
    | ATOM
    | ASSIGN
  
end

include MenhirBasics

# 1 "miniooMENHIR.mly"
   (* header *)

open MiniooDeclarations


# 66 "miniooMENHIR.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : WHILE.
        Start symbol: prog. *)

  | MenhirState05 : (('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_VARIABLE, _menhir_box_prog) _menhir_state
    (** State 05.
        Stack shape : PROC VARIABLE.
        Start symbol: prog. *)

  | MenhirState15 : (('s, _menhir_box_prog) _menhir_cell1_LBRACKET, _menhir_box_prog) _menhir_state
    (** State 15.
        Stack shape : LBRACKET.
        Start symbol: prog. *)

  | MenhirState16 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 16.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState20 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 20.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState22 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 22.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState24 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 24.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState26 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 26.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState28 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_bool_expr, _menhir_box_prog) _menhir_state
    (** State 28.
        Stack shape : IF bool_expr.
        Start symbol: prog. *)

  | MenhirState29 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_bool_expr, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_state
    (** State 29.
        Stack shape : IF bool_expr THEN.
        Start symbol: prog. *)

  | MenhirState31 : (('s, _menhir_box_prog) _menhir_cell1_ATOM, _menhir_box_prog) _menhir_state
    (** State 31.
        Stack shape : ATOM.
        Start symbol: prog. *)

  | MenhirState33 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 33.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState36 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 36.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState41 : (('s, _menhir_box_prog) _menhir_cell1_cmd, _menhir_box_prog) _menhir_state
    (** State 41.
        Stack shape : cmd.
        Start symbol: prog. *)

  | MenhirState44 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_bool_expr, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_cmd, _menhir_box_prog) _menhir_state
    (** State 44.
        Stack shape : IF bool_expr THEN cmd.
        Start symbol: prog. *)

  | MenhirState49 : ((('s, _menhir_box_prog) _menhir_cell1_LBRACKET, _menhir_box_prog) _menhir_cell1_cmds, _menhir_box_prog) _menhir_state
    (** State 49.
        Stack shape : LBRACKET cmds.
        Start symbol: prog. *)

  | MenhirState53 : ((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_bool_expr, _menhir_box_prog) _menhir_state
    (** State 53.
        Stack shape : WHILE bool_expr.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_bool_expr = 
  | MenhirCell1_bool_expr of 's * ('s, 'r) _menhir_state * (
# 23 "miniooMENHIR.mly"
      (bool_expr)
# 164 "miniooMENHIR.ml"
)

and ('s, 'r) _menhir_cell1_cmd = 
  | MenhirCell1_cmd of 's * ('s, 'r) _menhir_state * (
# 22 "miniooMENHIR.mly"
      (cmd)
# 171 "miniooMENHIR.ml"
)

and ('s, 'r) _menhir_cell1_cmds = 
  | MenhirCell1_cmds of 's * ('s, 'r) _menhir_state * (
# 21 "miniooMENHIR.mly"
      (cmds)
# 178 "miniooMENHIR.ml"
)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (
# 24 "miniooMENHIR.mly"
      (expr)
# 185 "miniooMENHIR.ml"
)

and ('s, 'r) _menhir_cell1_ATOM = 
  | MenhirCell1_ATOM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACKET = 
  | MenhirCell1_LBRACKET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_THEN = 
  | MenhirCell1_THEN of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_VARIABLE = 
  | MenhirCell0_VARIABLE of 's * (
# 15 "miniooMENHIR.mly"
       ( string )
# 207 "miniooMENHIR.ml"
)

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (
# 19 "miniooMENHIR.mly"
       (MiniooDeclarations.cmds)
# 217 "miniooMENHIR.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun b ->
    (
# 55 "miniooMENHIR.mly"
                                 ( Bool b )
# 225 "miniooMENHIR.ml"
     : (
# 23 "miniooMENHIR.mly"
      (bool_expr)
# 229 "miniooMENHIR.ml"
    ))

let _menhir_action_02 =
  fun e1 e2 ->
    (
# 56 "miniooMENHIR.mly"
                                 ( Equals(e1, e2) )
# 237 "miniooMENHIR.ml"
     : (
# 23 "miniooMENHIR.mly"
      (bool_expr)
# 241 "miniooMENHIR.ml"
    ))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 57 "miniooMENHIR.mly"
                                 ( Lessthan(e1, e2) )
# 249 "miniooMENHIR.ml"
     : (
# 23 "miniooMENHIR.mly"
      (bool_expr)
# 253 "miniooMENHIR.ml"
    ))

let _menhir_action_04 =
  fun x ->
    (
# 39 "miniooMENHIR.mly"
                                            ( VarDecl x )
# 261 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 265 "miniooMENHIR.ml"
    ))

let _menhir_action_05 =
  fun e f ->
    (
# 40 "miniooMENHIR.mly"
                                            ( ProcCall(f, e) )
# 273 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 277 "miniooMENHIR.ml"
    ))

let _menhir_action_06 =
  fun e x ->
    (
# 42 "miniooMENHIR.mly"
                                            ( AssignVal(x, e) )
# 285 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 289 "miniooMENHIR.ml"
    ))

let _menhir_action_07 =
  fun x ->
    (
# 43 "miniooMENHIR.mly"
                                            ( Malloc x )
# 297 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 301 "miniooMENHIR.ml"
    ))

let _menhir_action_08 =
  fun () ->
    (
# 45 "miniooMENHIR.mly"
                                            ( Skip )
# 309 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 313 "miniooMENHIR.ml"
    ))

let _menhir_action_09 =
  fun c ->
    (
# 46 "miniooMENHIR.mly"
                                            ( Sequence c )
# 321 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 325 "miniooMENHIR.ml"
    ))

let _menhir_action_10 =
  fun b c ->
    (
# 47 "miniooMENHIR.mly"
                                                         ( While(b, c) )
# 333 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 337 "miniooMENHIR.ml"
    ))

let _menhir_action_11 =
  fun b c1 c2 ->
    (
# 48 "miniooMENHIR.mly"
                                                         ( IfElse(b, c1, c2) )
# 345 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 349 "miniooMENHIR.ml"
    ))

let _menhir_action_12 =
  fun b c ->
    (
# 49 "miniooMENHIR.mly"
                                                         ( If(b, c) )
# 357 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 361 "miniooMENHIR.ml"
    ))

let _menhir_action_13 =
  fun c1 c2 ->
    (
# 50 "miniooMENHIR.mly"
                                                      ( Parallel(c1, c2) )
# 369 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 373 "miniooMENHIR.ml"
    ))

let _menhir_action_14 =
  fun c ->
    (
# 51 "miniooMENHIR.mly"
                                            ( Atom c )
# 381 "miniooMENHIR.ml"
     : (
# 22 "miniooMENHIR.mly"
      (cmd)
# 385 "miniooMENHIR.ml"
    ))

let _menhir_action_15 =
  fun c cs ->
    (
# 35 "miniooMENHIR.mly"
                                                            ( (c :: cs) )
# 393 "miniooMENHIR.ml"
     : (
# 21 "miniooMENHIR.mly"
      (cmds)
# 397 "miniooMENHIR.ml"
    ))

let _menhir_action_16 =
  fun c ->
    (
# 36 "miniooMENHIR.mly"
                                                            ( ([c]) )
# 405 "miniooMENHIR.ml"
     : (
# 21 "miniooMENHIR.mly"
      (cmds)
# 409 "miniooMENHIR.ml"
    ))

let _menhir_action_17 =
  fun f ->
    (
# 60 "miniooMENHIR.mly"
                                            ( Field f )
# 417 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 421 "miniooMENHIR.ml"
    ))

let _menhir_action_18 =
  fun n ->
    (
# 61 "miniooMENHIR.mly"
                                            ( Num n )
# 429 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 433 "miniooMENHIR.ml"
    ))

let _menhir_action_19 =
  fun e1 e2 ->
    (
# 62 "miniooMENHIR.mly"
                                            ( Minus(e1, e2) )
# 441 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 445 "miniooMENHIR.ml"
    ))

let _menhir_action_20 =
  fun () ->
    (
# 63 "miniooMENHIR.mly"
                                            ( Null )
# 453 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 457 "miniooMENHIR.ml"
    ))

let _menhir_action_21 =
  fun x ->
    (
# 64 "miniooMENHIR.mly"
                                            ( Variable x )
# 465 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 469 "miniooMENHIR.ml"
    ))

let _menhir_action_22 =
  fun e1 e2 ->
    (
# 65 "miniooMENHIR.mly"
                                            ( FieldAccess(e1, e2) )
# 477 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 481 "miniooMENHIR.ml"
    ))

let _menhir_action_23 =
  fun c x ->
    (
# 66 "miniooMENHIR.mly"
                                            ( Proc(x, c) )
# 489 "miniooMENHIR.ml"
     : (
# 24 "miniooMENHIR.mly"
      (expr)
# 493 "miniooMENHIR.ml"
    ))

let _menhir_action_24 =
  fun _1 ->
    (
# 32 "miniooMENHIR.mly"
                ( _1 )
# 501 "miniooMENHIR.ml"
     : (
# 19 "miniooMENHIR.mly"
       (MiniooDeclarations.cmds)
# 505 "miniooMENHIR.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ASSIGN ->
        "ASSIGN"
    | ATOM ->
        "ATOM"
    | BOOL _ ->
        "BOOL"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EOL ->
        "EOL"
    | FIELD _ ->
        "FIELD"
    | IF ->
        "IF"
    | LBRACKET ->
        "LBRACKET"
    | LEQUALS ->
        "LEQUALS"
    | LESSTHAN ->
        "LESSTHAN"
    | LPAREN ->
        "LPAREN"
    | MALLOC ->
        "MALLOC"
    | MINUS ->
        "MINUS"
    | NULL ->
        "NULL"
    | NUM _ ->
        "NUM"
    | PARALLEL ->
        "PARALLEL"
    | PROC ->
        "PROC"
    | RBRACKET ->
        "RBRACKET"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SKIP ->
        "SKIP"
    | THEN ->
        "THEN"
    | VAR ->
        "VAR"
    | VARIABLE _ ->
        "VARIABLE"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_56 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOL ->
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState01 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIABLE _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FIELD _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let x = _v in
      let _v = _menhir_action_21 x in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState33 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState53 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState49 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState41 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN | ATOM | ELSE | EOL | FIELD _ | IF | LBRACKET | LEQUALS | LESSTHAN | LPAREN | MALLOC | NULL | NUM _ | PARALLEL | PROC | RBRACKET | RPAREN | SEMICOLON | SKIP | THEN | VAR | VARIABLE _ | WHILE ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_06 e x in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState20 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIABLE _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FIELD _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIABLE _v ->
          let _menhir_stack = MenhirCell0_VARIABLE (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN ->
              let _menhir_s = MenhirState05 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WHILE ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | VARIABLE _v ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | VAR ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SKIP ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | PROC ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NUM _v ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NULL ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MALLOC ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRACKET ->
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IF ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FIELD _v ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | ATOM ->
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIABLE _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_04 x in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_cmd : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState53 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState05 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState29 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState49 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState41 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_54 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_bool_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bool_expr (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_10 b c in
      _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_52 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_VARIABLE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_VARIABLE (_menhir_stack, x) = _menhir_stack in
      let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_23 c x in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_46 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_bool_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bool_expr (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_12 b c in
      _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_45 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_bool_expr, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_cmd -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_cmd (_menhir_stack, _, c1) = _menhir_stack in
      let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_bool_expr (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let c2 = _v in
      let _v = _menhir_action_11 b c1 c2 in
      _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_43 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_bool_expr, _menhir_box_prog) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_cmd (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState44 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | VAR ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SKIP ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MALLOC ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACKET ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ATOM ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_08 () in
      _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_18 n in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_20 () in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIABLE _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_07 x in
                  _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState15 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | VARIABLE _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | VAR ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SKIP ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MALLOC ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACKET ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FIELD _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState16 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIABLE _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FIELD _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let f = _v in
      let _v = _menhir_action_17 f in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let b = _v in
      let _v = _menhir_action_01 b in
      _menhir_goto_bool_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bool_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_53 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bool_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | VARIABLE _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState53
      | VAR ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | SKIP ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | NUM _v_1 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState53
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | MALLOC ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | LBRACKET ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | FIELD _v_2 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState53
      | ATOM ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ATOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState31 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | VAR ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SKIP ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MALLOC ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACKET ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ATOM ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bool_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | VARIABLE _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState28
      | VAR ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState28) in
          let _menhir_s = MenhirState29 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | VAR ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SKIP ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MALLOC ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACKET ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ATOM ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | SKIP ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | NUM _v_4 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState28
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | MALLOC ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | LBRACKET ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | FIELD _v_5 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState28
      | ATOM ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_cmd (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState41 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | VAR ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SKIP ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MALLOC ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACKET ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ATOM ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOL | PARALLEL | RBRACKET | RPAREN ->
          let c = _v in
          let _v = _menhir_action_16 c in
          _menhir_goto_cmds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_cmds : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_56 _menhir_stack _v _tok
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState41 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState31 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LBRACKET, _menhir_box_prog) _menhir_cell1_cmds -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_cmds (_menhir_stack, _, c1) = _menhir_stack in
          let MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) = _menhir_stack in
          let c2 = _v in
          let _v = _menhir_action_13 c1 c2 in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LBRACKET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) = _menhir_stack in
          let c = _v in
          let _v = _menhir_action_09 c in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PARALLEL ->
          let _menhir_stack = MenhirCell1_cmds (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState49 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | VAR ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SKIP ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MALLOC ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACKET ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ATOM ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_cmd -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_cmd (_menhir_stack, _menhir_s, c) = _menhir_stack in
      let cs = _v in
      let _v = _menhir_action_15 c cs in
      _menhir_goto_cmds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_ATOM -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ATOM (_menhir_stack, _menhir_s) = _menhir_stack in
          let c = _v in
          let _v = _menhir_action_14 c in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState22 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIABLE _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FIELD _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, f) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_05 e f in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LPAREN ->
          let _menhir_s = MenhirState33 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DOT ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN ->
          let _menhir_s = MenhirState36 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ATOM | FIELD _ | IF | LBRACKET | MALLOC | NULL | NUM _ | PROC | SKIP | THEN | VAR | VARIABLE _ | WHILE ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_02 e1 e2 in
          _menhir_goto_bool_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ATOM | FIELD _ | IF | LBRACKET | MALLOC | NULL | NUM _ | PROC | SKIP | THEN | VAR | VARIABLE _ | WHILE ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_03 e1 e2 in
          _menhir_goto_bool_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_22 e1 e2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN | ATOM | ELSE | EOL | FIELD _ | IF | LBRACKET | LEQUALS | LESSTHAN | LPAREN | MALLOC | MINUS | NULL | NUM _ | PARALLEL | PROC | RBRACKET | RPAREN | SEMICOLON | SKIP | THEN | VAR | VARIABLE _ | WHILE ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_19 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LESSTHAN ->
          let _menhir_s = MenhirState24 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LEQUALS ->
          let _menhir_s = MenhirState26 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIABLE _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NULL ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FIELD _v ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DOT ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | VARIABLE _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | VAR ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SKIP ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NULL ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MALLOC ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACKET ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FIELD _v ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ATOM ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 68 "miniooMENHIR.mly"
   (* trailer *)
# 1442 "miniooMENHIR.ml"
