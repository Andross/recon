#!/bin/bash
mkdir waybackdata
mkdir gaudata

while read p; do
  waybackurls $p | tee waybackdata/${p#*//}.waybackdata.txt
  gau $p | tee gaudata/${p#*//}.gaudata.txt
done <$1 
