# Build the files
build:
	latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode main.tex

# Indent the code of main.tex
indent:
	latexindent -m -w main.tex

# Clean the repository of artifacts and temp files
clean:
	rm -f *.pdf *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.bak* *.tdo *.ist *.run.xml *.syntex*
