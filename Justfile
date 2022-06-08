# Print the list
default:
	@just --list

# Build the files
build: tidy
	latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode insa.tex
	cp insa.pdf rapport_PAROL-GUARINO_Volodia.pdf

# Build the SIF report
sif:
	latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode -pvc sif.tex

# Build the INSA report
insa:
	latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode -pvc insa.tex

# Indent the code of main.tex
indent:
	latexindent -m -w content.tex
	latexindent -m -w appendix.tex
	latexindent -m -w abstract.tex
	latexindent -m -w resume.tex

# Tidy the bib and generate the file used for the report
tidy:
    cat biblio.bib > tmp.bib
    cat biblio-internship.bib >> tmp.bib
    bibtex-tidy --curly --numeric --space=2 --tab --align=13 --duplicates=key,doi,abstract,citation --merge=combine --sort-fields=title,shorttitle,author,year,month,day,journal,booktitle,location,on,publisher,address,series,volume,number,pages,doi,isbn,issn,url,urldate,copyright,category,note,metadata --encode-urls --remove-empty-fields tmp.bib
    mv tmp.bib internship.bib

# Clean the repository of artifacts and temp files
clean:
	rm -f *.pdf *.out *aux *bbl *blg *log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.bak* *.tdo *.ist *.run.xml *.syntex*
