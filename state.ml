type symbTable = (string * int) list ;;

type object = symbTable;;

type stack = symbTable;;

type closure = (int * body * stack)

type heap = symbTable list;;

type symbSet = string list;;

(*Pretty Printing*)
let print_stack() = print_string "hi, I am stack :3\n";;
let print_heap() = print_string "hi, I am heap :P\n";;

let print_state () = print_stack(); print_heap();;

(*Set Operations*)
let contains x symbSet =
	List.exists (function y-> y=x) !symbSet;;

let add x symbSet =
	if ! contains x symbSet then 
	symbSet := x ::symbSet 

(*Retrieves first value*)
let rec getFirst x stack = match !stack with
	[] -> print_string "Location not found in Stack\n"; flush stdout; -1 (*Should be impossible with semantic checking*)
	| (v, l) :: t -> if (x = v) then l
		else getFirst x t;;


(*symbTable Operations*)
let getvalue x sb = 
	if (List.mem_assoc x !sb) then
		(List.assoc x !sb)
	else
		error();;

let rec except x l = match l with
  	[]   -> []
	| h::t -> if (h = x) then t
            else h::(except x t)

let setvalue x v sb =
  	(print_string (x ^ " = "); print_int (v);
   	print_string ";\n"; flush stdout;
   	if (List.mem_assoc x !sb) then
     	sb := (x, v) :: (except (x, (List.assoc x !sb)) !sb)
   	else
     	sb := (x, v) :: !sb 
  	);;