#!/bin/bash
markdown_py -x tables -x attr_list -x md_in_html -x def_list -x smarty src/$1.md > src/output.html
echo 'exit markdown_py --->'
cat src/head.txt src/output.html src/tail.txt > output/$1.html
echo 'exit cat --->'
weasyprint output/$1.html output/$1.pdf
echo 'exit weasyprint --->'
