# Name: run-batch.sh
# Description: submit all CCQ batch jobs with pattern

for f in ./*"${1}"; do  # for each file with pattern in directory
  /opt/CloudyCluster/srv/CCQ/ccqsub "$f"  # submit CCQ job
done
