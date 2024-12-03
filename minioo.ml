open Parsing
open MiniooDeclarations
open MiniooMENHIR

let usage_msg = "Usage: ./parser [-v | -verbose]"

let anon_arg_handler _ = () (* Ignore anonymous arguments *)

let verbose = ref false

let options = [("-v", Arg.Set verbose, "Output AST");("-verbose", Arg.Set verbose, "Output AST")]

let () = Arg.parse options anon_arg_handler usage_msg;;

print_endline (Printf.sprintf "minioo (Verbose = %b)" !verbose ) ;

try
  let lexbuf = Lexing.from_channel stdin in
  while true do
    print_string "moo# ";
    flush stdout;
    let () = 
      try
        let commands =  MiniooMENHIR.prog MiniooLEX.token lexbuf in 
        if !verbose then print_endline (pretty_print_cmds "" commands)
      with
      MiniooLEX.TokenError c -> 
        Printf.fprintf stderr "Invalid Token: %c\n" c;
        flush stderr;
        Lexing.flush_input lexbuf
      | MiniooMENHIR.Error -> 
        let pos = Lexing.lexeme_start lexbuf in Printf.fprintf stderr "Syntax error at: %d\n" pos;
        flush stderr;
        Lexing.flush_input lexbuf
    in
    clear_parser()
  done
with MiniooLEX.Eof ->
  print_endline "End of File"
;;
