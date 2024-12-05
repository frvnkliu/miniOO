open Parsing
open MiniooDeclarations
(* Command Line Arguments*)
let usage_msg = "Usage: ./parser [-v | -verbose]"

let anon_arg_handler _ = () (* Ignore anonymous arguments *)

let verbose = ref false;;

let vverbose = ref false;;

let options = [("-v", Arg.Set verbose, "Output AST at each step and State at end of program");("-vv", Arg.Set vverbose, "Output AST and State at each Step and final State at the end of program")]

let () = Arg.parse options anon_arg_handler usage_msg;;

(* State *)
let stack = (Hashtbl.create 10 : TransitionDeclarations.stack);;

let heap = ref([||] : TransitionDeclarations.heap);;

let print_state ()= 
  print_endline "\n=== State ===";
  TransitionDeclarations.print_stack stack;
  print_endline "-------------";
  TransitionDeclarations.print_heap !heap;
  print_newline();;

(* Main Function Command Execution *)
let run_commands commands =
  (* Print the AST if verbose*)
  if !verbose || !vverbose then print_endline ( "\n===AST===\n"^pretty_print_cmds "" commands);
  (* Check static semantics*)
  StaticSemantics.check_static_semantic_errors stack commands;
  (* Transitional Semantics *)
  TransitionalSemantics.eval_commands stack heap commands;
  if !vverbose then print_state();;

(* Signals *)
Sys.set_signal Sys.sigint (Sys.Signal_handle (fun _signum -> raise MiniooLEX.Eof));

print_endline (Printf.sprintf "Minioo version 1.0.0\nFor HPL by Frank Liu 2024\n");;


(*Idk how it works but it adds a single EoL token right before EoF*)
let from_channel_with_eol channel =
  let eof_reached = ref false in
  let eol_added = ref false in
  let buffer = Bytes.create 4096 in (* Buffer for reading input *)
  let rec input_with_eol bytes len =
    if !eof_reached then
      if not !eol_added && len > 0 then
        (Bytes.set bytes 0 '\n'; eol_added := true; 1) (* Add a single EOL *)
      else
        0
    else
      let bytes_read = input channel buffer 0 (min len 4096) in
      if bytes_read = 0 then
        (eof_reached := true; input_with_eol bytes len)
      else
        (Bytes.blit buffer 0 bytes 0 bytes_read; bytes_read)
  in
  Lexing.from_function input_with_eol
;;

let lexbuf_with_eol_from_channel channel =
  from_channel_with_eol channel
;;

(* Read characters and feed it to Lexer/Parser *)
let () =
  try
    let lexbuf = lexbuf_with_eol_from_channel stdin in
    while true do
      print_string "moo# ";
      flush stdout;
      let () =
        try
          let commands = MiniooMENHIR.prog MiniooLEX.token lexbuf in
          run_commands commands
        with
        | MiniooLEX.TokenError c ->
          Printf.fprintf stderr "Invalid Token: %c\n" c;
          flush stderr;
          Lexing.flush_input lexbuf
        | MiniooMENHIR.Error ->
          let pos = Lexing.lexeme_start lexbuf in
          Printf.fprintf stderr "Syntax error at: %d\n" pos;
          flush stderr;
          Lexing.flush_input lexbuf
        | StaticSemantics.StaticError s ->
          Printf.fprintf stderr "Static Semantics Error: %s\n" s;
          flush stderr;
          Lexing.flush_input lexbuf
        | TransitionalSemantics.TransitionError s ->
          Printf.fprintf stderr "Transitional Semantics Error: %s\n" s;
          flush stderr;
          Lexing.flush_input lexbuf
      in
      clear_parser ()
    done
  with MiniooLEX.Eof -> (
    print_endline "exit";
    if (!verbose || !vverbose) then (print_endline "===State at End of Program Execution===";print_state())
  )
