.PHONY: all bp clean clean-all recreate

all: bp

bp: bp.pdf

bp.pdf: index.tex
	pdflatex -interaction=nonstopmode -synctex=1 index.tex
	bibtex index.aux
	pdflatex -interaction=nonstopmode -synctex=1 index.tex
	pdflatex -interaction=nonstopmode -synctex=1 index.tex
	mv index.pdf bp.pdf

clean:
	rm -rf *.{log,out,pdf,aux,tfm,600pk,514pk,fls,toc,bbl,blg,fdb_latexmk,synctex.gz}

recreate: clean all
	evince bp.pdf
