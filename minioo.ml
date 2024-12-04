open Parsing
open MiniooDeclarations
open MiniooMENHIR

(* Command Line Arguments*)
let usage_msg = "Usage: ./parser [-v | -verbose]"

let anon_arg_handler _ = () (* Ignore anonymous arguments *)

let verbose = ref false;;

let options = [("-v", Arg.Set verbose, "Output AST");("-verbose", Arg.Set verbose, "Output AST")]

let () = Arg.parse options anon_arg_handler usage_msg;;

(* State *)
let stack = ref ([] : (string*int) list);;

let print_stack() =
print_string "Stack: ";
match !stack with
  | [] -> Printf.printf "Empty\n"
  | contents ->
      List.iter
        (fun (name, value) -> Printf.printf "(%s, %d) " name value)
        contents;
      Printf.printf "\n"
let print_heap() = print_string "hi, I am heap :P\n";;

let print_state() = 
  print_endline "\n=== State at end of program ===";
  print_stack();
  print_heap();;

(* Command Execution *)
let run_commands commands =
  (* Print the AST if verbose*)
  if !verbose then print_endline (pretty_print_cmds "" commands);
  (* Check static semantics*)
  StaticSemantics.check_static_semantic_errors !stack commands;;


(* Signals *)
Sys.set_signal Sys.sigint (Sys.Signal_handle (fun _signum -> raise MiniooLEX.Eof));;

print_endline (Printf.sprintf "minioo (Verbose = %b)" !verbose );;
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
    in
    clear_parser()
  done
with MiniooLEX.Eof ->
  if !verbose then print_state()
;;
