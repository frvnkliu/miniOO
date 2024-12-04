all: delete
	ls
	@echo "# Type declarations:"
	cat miniooDeclarations.ml
	ocamlc -c miniooDeclarations.ml
	
	@echo "# Static semantics:"
	cat staticSemantics.ml
	ocamlc -c staticSemantics.ml

	@echo "# Lexer specification:"
	cat miniooLEX.mll
	ocamllex miniooLEX.mll
	ls

	@echo "# Parser specification:"
	cat miniooMENHIR.mly

	@echo "# Parser creation:"
	menhir --explain miniooMENHIR.mly
	ls

	@echo "# types of values returned by lexems:"
	cat miniooMENHIR.mli

	@echo "# Compilation of the lexer and parser:"
	ocamlc -c miniooMENHIR.mli
	ocamlc -c miniooLEX.ml
	ocamlc -c miniooMENHIR.ml

	@echo "# Specification of minioo:"
	cat minioo.ml 

	@echo "# Compilation of the minioo:"
	ocamlc -c minioo.ml

	@echo "# Linking of compiled files the type declaration, lexer, parser & minioo"
	ocamlc -o minioo miniooDeclarations.cmo staticSemantics.cmo miniooLEX.cmo miniooMENHIR.cmo minioo.cmo

	@echo "# Using minioo:"
	@echo ./minioo -v < examples/prog1.moo

delete:
	/bin/rm -f minioo *.cmi *.cmo miniooLEX.ml miniooMENHIR.mli miniooMENHIR.ml makefile~