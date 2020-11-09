!#/bin/bash

for f in ./*-old.csv; do
  awk 'NR%2==1' "$f" | sed '1d' > "$f".clean    
done
