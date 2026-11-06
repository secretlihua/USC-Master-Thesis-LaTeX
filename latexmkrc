# Project-local configuration; no absolute paths or fixed root-file name.
# XeLaTeX -> BibTeX when needed -> XeLaTeX until references converge.
$pdf_mode = 5;
$do_cd = 1;
$out_dir = '.';
$aux_dir = 'auxiliary';
$emulate_aux = 1;
$xelatex = 'xelatex -no-shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex_use = 2;
$max_repeat = 6;
