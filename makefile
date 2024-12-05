all: delete
	ls
	@echo "# Type declarations:"
	cat miniooDeclarations.ml
	ocamlc -c miniooDeclarations.ml
	
	@echo "# Static semantics:"
	cat staticSemantics.ml
	ocamlc -c staticSemantics.ml

	@echo "# Transitional semantics:"
	cat transitionalSemantics.ml
	ocamlc -c transitionalSemantics.ml

	@echo "# Lexer specification:"
	cat miniooLEX.mll
	ocamllex miniooLEX.mll
	ls

	@echo "# Parser specification:"
	cat miniooMENHIR.mly

	@echo "# Parser creation:"
	menhir miniooMENHIR.mly
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
	ocamlc -o minioo miniooDeclarations.cmo staticSemantics.cmo transitionalSemantics.cmo miniooLEX.cmo miniooMENHIR.cmo minioo.cmo

	@echo "===== Using minioo: ====="
	@echo "# Example 1"
	./minioo < examples/prog1.moo
	@echo "# Example 2"
	./minioo < examples/prog2.moo
	@echo "# Example 3"
	./minioo < examples/prog3.moo
	@echo "# Example 2 With Verbose Flag"
	./minioo -v < examples/prog2.moo
	@echo "# Example 2 With VVerbose Flag"
	./minioo -v < examples/prog2.moo

delete:
	/bin/rm -f minioo *.cmi *.cmo miniooLEX.ml miniooMENHIR.mli miniooMENHIR.ml makefile~