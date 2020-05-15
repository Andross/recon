#!/bin/bash
#get whole domain
PWD=$(pwd)
URL=$1
#remove .com from domain
GITROBURL=$(echo $URL | cut -d '.' -f 2)
SUBLISTERURL=$(echo $URL | cut -d '.' -f 2-)
ASSETFINDERDOMAIN=SUBLISTERURL
#starting gitrob
~/go/bin/gitrob $GITROBURL &
#starting sublist3r
$SUBLIST3R/sublist3r.py -d $SUBLISTERURL -v -o $PWD/domains.txt
#running assetfinder
~/go/bin/assetfinder --subs-only $ASSETFINDERDOMAIN | tee -a $PWD/domains.txt
#removing duplicate entries
sort -u $PWD/domains.txt -o $PWD/domains.txt
#checking for alive domains
echo "\n\n[+] Checking for alive domains..\n"
cat $PWD/domains.txt | ~/go/bin/httprobe | tee -a $PWD/alive.txt
#formatting the data to json
cat $PWD/alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > alive.json
cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > $PWD/domains.json
