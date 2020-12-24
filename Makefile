JOBNAME=main
TEX=xelatex
SRC=$(JOBNAME).tex
CLS=pgreport.cls
REF=reference.bib
BIB=bibtex

$(JOBNAME).pdf: $(SRC) $(REF) $(CLS)
	$(TEX) $(SRC)
	$(BIB) $(JOBNAME)
	$(TEX) $(SRC)
	$(TEX) $(SRC)
clean:
	rm $(JOBNAME).aux $(JOBNAME).log $(JOBNAME).out $(JOBNAME).bbl $(JOBNAME).blg
