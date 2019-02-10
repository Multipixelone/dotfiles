#!/usr/bin/env zsh
rm -f /home/tunnel/Documents/Programs/MDPDF/cool.pdf && rm -f /home/tunnel/Documents/Programs/MDPDF/cool.html && pandoc -f markdown -t html5 $1 -o /home/tunnel/Documents/Programs/MDPDF/cool.html && echo '<link rel="stylesheet" type="text/css" href="/home/tunnel/Documents/Programs/MDPDF/tufte.css">' | cat - /home/tunnel/Documents/Programs/MDPDF/cool.html | wkhtmltopdf - "/home/tunnel/Documents/Programs/MDPDF/cool.pdf" && pkill mupdf || true && mupdf /home/tunnel/Documents/Programs/MDPDF/cool.pdf &

