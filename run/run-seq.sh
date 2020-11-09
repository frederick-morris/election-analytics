# Name: run-seq.sh
# Description: process queries from old/active datasets sequentially

CONUM=2290 # county id

while read p; do
  ./get-html-"${1}".sh "${p}" "${CONUM}"  # run query script for each county
  CONUM=$((CONUM+1)) # iterate for each county
done <counties.txt
