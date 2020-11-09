!#/bin/bash

CONUM=2290

while read p; do
  ./get-html-2.sh "${p}" "${CONUM}"
  CONUM=$((CONUM+1))
done <counties.txt
