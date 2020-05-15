#!/bin/bash 

curl -X "POST" -d $1 $2 | grep "Cookie:" 
