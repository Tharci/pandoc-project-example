#!/bin/sh

structure=`cat document-structure`

if [ -z $1 ]; then
	output="output/out.pdf"
else
	output=$1
fi

for page in $structure
do
	cat pages/$page >> full.md
	echo "\pagebreak" >> full.md
	echo "" >> full.md
done

pandoc -V papersize:a4 --resource-path ./pages --columns=10 -f markdown --pdf-engine=xelatex --highlight-style highlight.theme full.md -o $output

rm full.md
