JOBNAME=main
TEX=xelatex
SRC=$(JOBNAME).tex
CLS=pgreport.cls
REF=reference.bib
BIB=bibtex

$(JOBNAME).pdf: $(SRC) $(REF) $(CLS) src/*.tex
	$(TEX) $(SRC)
	$(BIB) $(JOBNAME)
	$(TEX) $(SRC)
	$(TEX) $(SRC)
clean:
	rm *.aux $(JOBNAME).log $(JOBNAME).out $(JOBNAME).bbl $(JOBNAME).blg $(JOBNAME).toc
	rm src/*.aux
