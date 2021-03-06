NAME=MSR-design
AUX=$(NAME).aux
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).log $(NAME).out

all: $(NAME).pdf

$(NAME).pdf : $(NAME).tex $(NAME).bib
	pdflatex -shell-escape $(NAME)
	bibtex $(NAME)
	pdflatex -shell-escape $(NAME)
	pdflatex -shell-escape $(NAME)

$(NAME).bib : Zotero.bib non-Zotero.bib
	cat $^ > $@

clean :
	rm $(AUX) $(INTERMEDIATES)

clobber :
	rm $(NAME).pdf
