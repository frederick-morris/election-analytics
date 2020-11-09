!#/bin/bash

while read k; do
  echo "$k"
  for f in ./*-${k}.html; do
    cat "${f}" | grep -i -B 6 -A 31 "${1}" > "${f}".clean
  done
done < /mnt/orangefs/team3/jobs/counties.txt
find . -size 0 -delete

