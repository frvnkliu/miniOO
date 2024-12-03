open Parsing;;

let verbose = ref false
Arg.parse 
[("-v", Arg.Set verbose, "Output AST"),
("-verbose", Arg.Set verbose, "Output AST")]

try lexbuf = Lexing.from_channel stdin in
  while true do
    let ast =  miniOOMENHIR.prog miniooLEX.token lexbuf in
      if verbose then (print_ast ast; print_state())
      
  with miniOOMENHIR.Error ->
    (print_string "Syntax error ..." ; print_newline ()) ;
    clear_parser ()
  done
with miniOOLEX.Eof ->
  print_state()
  ()
;;