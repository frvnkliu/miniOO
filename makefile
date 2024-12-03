all: delete
	echo "# Lexer specification:"
	cat miniooLEX.mll
	ocamllex miniooLEX.mll
	ls
	echo "# Parser specification:"
	cat miniooMENHIR.mly
	echo "# Parser creation:"
	menhir --explain miniooMENHIR.mly

delete:
	/bin/rm -f minioo *.cmi *.cmo miniooLEX.ml miniooMENHIR.mli miniooMENHIR.ml makefile~