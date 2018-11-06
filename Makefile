PANDOC:=pandoc
FILTERS:= filters/env.hs pandoc-citeproc
PFLAGS:= $(foreach filter,$(FILTERS),-F $(filter))
SRCS:= intro.md


.PHONY: all clean check

all: trabajo.pdf

trabajo.pdf: $(SRCS) assets/citas.bib
	$(PANDOC) $(PFLAGS) -H assets/math.sty  $< -o $@

clean:
	rm trabajo.pdf
