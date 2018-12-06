PANDOC:=pandoc
FILTERS:= filters/env.hs filters/pandoc-crossref pandoc-citeproc
PFLAGS:= $(foreach filter,$(FILTERS),-F $(filter))
SRCS:= intro.md definiciones.md convolucion.md cuantica.md final.md


.PHONY: all clean check

all: trabajo.pdf

trabajo.pdf: $(SRCS) assets/citas.bib
	$(PANDOC) $(PFLAGS) -H assets/math.sty  $(SRCS) -o $@

clean:
	rm trabajo.pdf
