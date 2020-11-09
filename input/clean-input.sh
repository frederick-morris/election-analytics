# Name: clean-input.sh
# Description: Removes header and intermidiate lines from registration data.

for f in ./*-old.csv; do                       # for each registration file with active voters older than 100
  awk 'NR%2==1' "$f" | sed '1d' > "$f".clean   # trim header and every other line 
done
