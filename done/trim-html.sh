!#/bin/bash

# Name: trim-html.sh
# Description: Trim raw HTML from ballot tracker to retrieve parsable ballot data. 

# for each county 
while read k; do 
  echo "$k"
  for f in ./*-${k}.html; do                                # for each .html output file 
    cat "${f}" | grep -i -B 6 -A 31 "${1}" > "${f}".clean   # match pattern and get surrounding data
  done
done < /mnt/orangefs/team3/jobs/counties.txt
find . -size 0 -delete # delete empty output files

