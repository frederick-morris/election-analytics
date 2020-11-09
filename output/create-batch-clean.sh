# Name: create-batch.sh
# Description: Create web scraper slurm job for each county 

CONUM=2290  # init county number

while read cnty; do             # for each county                  
  echo "$cnty"
  

  /bin/su -c "cat <<'EOF'> "${cnty}"-clean-aggr-"${1}".batch    # create batch script
#!/bin/bash
#SBATCH -N 1
#SBATCH --mem=4G
#SBATCH --ntasks-per-node=1
#SBATCH -e "/mnt/orangefs/team3/jobs/work/slurm-%j.err"
#SBATCH -o "/mnt/orangefs/team3/jobs/work/slurm-%j.out"
#SBATCH -D "/mnt/orangefs/team3/jobs/work/jobs"

echo "$cnty"

cd "${2}"

./trim-html.sh "${cnty}"  # run script to trim html into a cleaned format
./aggr-data.sh "${cnty}"  # run script to aggregate cleaned html into output files 

EOF
"


done < /mnt/orangefs/team3/jobs/counties.txt # read counties file as input
