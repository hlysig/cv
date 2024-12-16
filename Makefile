define compile_latex
	latex $(1).tex
	dvips -t a4 -Ppdf $(1).dvi
	dvips -t a4 -Ppdf -G0 $(1).dvi
	dvips -t a4 -Pcmz -Pamz $(1).dvi -o
	ps2pdf $(1).ps
endef

default: build

build:
	$(call compile_latex,cv)
	mkdir -p output
	mv cv.pdf output/hlysig_cv.pdf

clean:
	rm -f *.dvi
	rm -f *.log
	rm -f *.aux
	rm -f cv.ps
