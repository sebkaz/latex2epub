#!/bin/bash

latexDir=../latex
resEbook=resulting-ebook.epub

# convert LaTeX files to Markdown
for f in `cat files.txt` 
do 
  cat $latexDir/$f.tex | perl latex2md.pl > $f.md 
done

# process Markdown using Pandoc

for i in `cat files.txt`
do
  echo $i.md
done | xargs /usr/bin/pandoc \
  -o resEbook \
  -t epub3 \
  --toc \
  --toc-depth=2 \
  --epub-chapter-level=2 \
  metadata.yaml
