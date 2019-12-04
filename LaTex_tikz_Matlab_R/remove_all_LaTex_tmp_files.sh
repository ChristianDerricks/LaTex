#!/bin/bash

name="tikz_includable"

rm *.aux
rm *.idx
rm *.log
rm $name.bbl
rm $name.bib.bak
rm $name.blg
rm $name.idx
rm $name.lof
rm $name.lot
rm $name.log
rm $name.out
rm $name.toc
rm $name.synctex.gz
rm $name.pdf
rm $name.ilg
rm $name.ind
rm $name.run.xml
rm $name.bcf
rm babelbst.tex
rm $name.glsdefs
rm $name.ist
rm $name.acn
rm $name.acr
rm $name.slg
rm $name.syi
rm $name.gls
rm $name.glg
rm $name.alg
rm $name.glo
rm $name-index.bib
rm $name.syg
rm $name.ulG
rm $name.uni
rm $name.unin
rm $name.symn
rm $name.slG
rm $name.sym

rm -R */*.aux
cd .. && rm -R *.aux

exit 0
