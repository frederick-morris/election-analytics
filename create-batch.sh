CONUM=2290

while read cnty; do
  echo "$cnty"


  /bin/su -c "cat <<'EOF'> $cnty"${1}".batch
#!/bin/bash
#SBATCH -N 1
#SBATCH --mem=4G
#SBATCH --ntasks-per-node=1
#SBATCH -e "/mnt/orangefs/team3/jobs/work/slurm-%j.err"
#SBATCH -o "/mnt/orangefs/team3/jobs/work/slurm-%j.out"
#SBATCH -D "/mnt/orangefs/team3/jobs/work/jobs"

echo "$cnty"

/mnt/orangefs/team3/jobs/get-html-3.sh "${cnty}" "${CONUM}"

EOF
"
  CONUM=$((CONUM+1))


done < /mnt/orangefs/team3/jobs/counties.txt
