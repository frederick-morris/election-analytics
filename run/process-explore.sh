# Name: process-explore.sh
# Description: process each county through explore.py 

while read p; do
  echo "$p"
  python3 /mnt/orangefs/team3/jobs/explore.py $p # process through explore.py
done <counties.txt # for each county in PA
