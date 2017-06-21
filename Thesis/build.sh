#!/bin/bash

# cleanup
function cleanupAUX() {
    find . -maxdepth 1 -name "*.aux" -exec rm {} \;
    find . -maxdepth 1 -name "*.bbl" -exec rm {} \;
    find . -maxdepth 1 -name "*.blg" -exec rm {} \;
    find . -maxdepth 1 -name "*.lof" -exec rm {} \;
    find . -maxdepth 1 -name "*.log" -exec rm {} \;
    find . -maxdepth 1 -name "*.lot" -exec rm {} \;
    find . -maxdepth 1 -name "*.out" -exec rm {} \;
    find . -maxdepth 1 -name "*.synctex.gz" -exec rm {} \;
    find . -maxdepth 1 -name "*.toc" -exec rm {} \;
}

function cleanupPDF() {
    find . -maxdepth 1 -name "*.pdf" -exec rm {} \;
}

# Some cleanup
cleanupAUX
cleanupPDF

# Create the actual doc
pdflatex --shell-escape bachelorproject.tex
bibtex bachelorproject
pdflatex --shell-escape bachelorproject.tex
pdflatex --shell-escape bachelorproject.tex

# Post creation cleanup
cleanupAUX