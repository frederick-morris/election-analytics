!#/bin/bash

for f in ./*"${1}"; do
  /opt/CloudyCluster/srv/CCQ/ccqsub "$f"
done
