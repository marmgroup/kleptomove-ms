#!/bin/bash

# Rscript --slave -e 'bookdown::render_book("index.rmd", "bookdown::pdf_document2")'

# to render source files
# Rscript --slave -e 'lapply(list.files(pattern = "\\d{2}\\w+.Rmd"), function(x) knitr::purl(x, output = sprintf("R/%s", gsub(".{4}$", ".R", x))))'

# copy pdfs and name correctly
rm ms_kleptomove_*.tex
rm docs/ms_kleptomove_*.pdf
cp -p overleaf-kleptomove/AmNat_MS_template.tex ms_kleptomove_`date -I`.tex
cp -p overleaf-kleptomove/AmNat_MS_template.pdf docs/ms_kleptomove_`date -I`.pdf
cp figures/fig_0*.png overleaf-kleptomove/figures

# build atlastools manual
# Rscript --slave -e 'devtools::build_manual(pkg = "../atlastools", path = "docs/")'

# render docx
pandoc overleaf-kleptomove/AmNat_MS_template.tex --bibliography=overleaf-kleptomove/kleptomove.bib -o ms_kleptomove_`date -I`.docx
