open Parsing
open MiniooDeclarations
(* Command Line Arguments*)
let usage_msg = "Usage: ./parser [-v | -verbose]"

let anon_arg_handler _ = () (* Ignore anonymous arguments *)

let verbose = ref false;;

let options = [("-v", Arg.Set verbose, "Output AST");("-verbose", Arg.Set verbose, "Output AST")]

let () = Arg.parse options anon_arg_handler usage_msg;;

(* State *)
let stack = (Hashtbl.create 10 : TransitionDeclarations.stack);;

let heap = ref([||] : TransitionDeclarations.heap);;

let print_state ()= 
  print_endline "\n=== State ===";
  TransitionDeclarations.print_stack stack;
  TransitionDeclarations.print_heap !heap

(* Command Execution *)
let run_commands commands =
  (* Print the AST if verbose*)
  if !verbose then print_endline (pretty_print_cmds "" commands);
  (* Check static semantics*)
  StaticSemantics.check_static_semantic_errors stack commands;
  (* Transitional Semantics *)
  TransitionalSemantics.eval_commands stack heap commands;
  if !verbose then print_state();;

(* Signals *)
Sys.set_signal Sys.sigint (Sys.Signal_handle (fun _signum -> raise MiniooLEX.Eof));

print_endline (Printf.sprintf "minioo (Verbose = %b)" !verbose );
try
  let lexbuf = Lexing.from_channel stdin in
  while true do
    print_string "moo# ";
    flush stdout;
    let () = 
      try
        let commands = MiniooMENHIR.prog MiniooLEX.token lexbuf in run_commands commands;
      with
      MiniooLEX.TokenError c -> 
        Printf.fprintf stderr "Invalid Token: %c\n" c;
        flush stderr;
        Lexing.flush_input lexbuf
      | MiniooMENHIR.Error -> 
        let pos = Lexing.lexeme_start lexbuf in Printf.fprintf stderr "Syntax error at: %d\n" pos;
        flush stderr;
        Lexing.flush_input lexbuf
      | StaticSemantics.StaticError s ->
        Printf.fprintf stderr "Static Semantics Error: %s\n" s;
        flush stderr;
        Lexing.flush_input lexbuf
      (*
      | TransitionalSemantics.TransitionError s ->
        Printf.fprintf stderr "Transitional Semantics Error: %s\n" s;
        flush stderr;
        Lexing.flush_input lexbuf
      *)
    in
    clear_parser()
  done
with MiniooLEX.Eof -> 
  print_endline "exit"
;