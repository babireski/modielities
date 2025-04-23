compile:
	latexmk thesis.tex
	latexmk -c -bibtex -xelatex thesis.tex

clean:
	rm ./*/*.aux
