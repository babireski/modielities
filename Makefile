compile:
	latexmk thesis.tex
	latexmk -c -bibtex -xelatex thesis.tex
	rm ./*.fls
	rm ./*.log
	rm ./*.fdb_latexmk
	rm ./*/*.aux