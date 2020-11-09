!#/bin/bash

# Name: trim-html.sh
# Description: Trim raw HTML from ballot tracker to retrieve parsable ballot data. 

# for each county 
echo "${1}"
for f in ./*-"${1}".html; do                                # for each .html output file 
  cat "${f}" | grep -i -B 6 -A 31 "2020 GENERAL ELECTION" > "${f}".clean   # match pattern and get surrounding data
done
find . -size 0 -delete # delete empty output files

