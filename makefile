compile:
	latexmk main.tex
	latexmk -c -bibtex -xelatex main.tex
