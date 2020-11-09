#!/bin/bash

while read p; do
  echo "$p"
  python3 /mnt/orangefs/team3/jobs/explore.py $p
done <counties.txt 
