#!/bin/bash

#cat $(pwd)/alive.txt | ~/go/bin/hakrawler | kxss

FILES=$(pwd)/waybackdata/*

for f in $FILES
do 

while read p; do
  kxss $p
done <$f

done

GAUFILES=$(pwd)/gaudata/*

for f in $FILES
do

while read p; do
  kxss $p
done <$f

done
