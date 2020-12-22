JOBNAME=main
TEX=xelatex
SRC=$(JOBNAME).tex
REF=reference.bib
BIB=bibtex

$(JOBNAME).pdf: $(SRC) $(REF)
	$(TEX) $(SRC)
	$(BIB) $(JOBNAME)
	$(TEX) $(SRC)

clean:
	rm $(JOBNAME).aux $(JOBNAME).log $(JOBNAME).out $(JOBNAME).bbl $(JOBNAME).blg
