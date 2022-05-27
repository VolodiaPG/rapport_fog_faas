build:
	latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode main.tex

indent:
	latexindent -m -w main.tex

.PHONY: clean

clean:
	rm -f *.pdf *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.bak*