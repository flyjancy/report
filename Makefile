JOBNAME=main
TEX=xelatex
SRC=$(JOBNAME).tex
STYLE=report.cls
REF=reference.bib
BIB=bibtex

$(JOBNAME).pdf: $(SRC) $(REF) $(STYLE)
	$(TEX) $(SRC)
	$(BIB) $(JOBNAME)
	$(TEX) $(SRC)
	$(TEX) $(SRC)
clean:
	rm $(JOBNAME).aux $(JOBNAME).log $(JOBNAME).out $(JOBNAME).bbl $(JOBNAME).blg
