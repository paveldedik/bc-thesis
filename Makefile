.PHONY: all bp clean clean-all recreate

all: bp

bp: bp.pdf

bp.pdf: index.tex
	pdflatex index.tex && pdflatex index.tex
	mv index.pdf bp.pdf

clean:
	rm -rf *.log *.out *.aux *.toc *.tfm *.600pk *.514pk

clean-all: clean
	rm -rf *.pdf

recreate: clean-all all
	evince bp.pdf
