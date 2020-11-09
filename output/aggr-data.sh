# Name: aggr-data.sh
# Description: aggregates cleaned HTML queries into readable table

while read cnty; do # for each county
  echo "$cnty"
  file="${cnty}-ballot-out.csv" # output format
  echo "" > "${file}" # clear file
  for f in ./*-"${cnty}".html.clean; do   # for each cleaned HTML query
      sed '1q;d' "${f}" | xargs >> "${file}"   # get ballot type
      echo -e '\t' >> "${file}"
      sed '13q;d' "${f}" | xargs >> "${file}"  # get application submission date
      echo -e '\t' >> "${file}"
      sed '19q;d' "${f}" | xargs >> "${file}"  # get application recieved date
      echo -e '\t' >> "${file}"
      sed '25q;d' "${f}" | xargs >> "${file}"  # get ballot sent date
      echo -e '\t' >> "${file}"
      sed '31q;d' "${f}" | xargs >> "${file}"  # get ballot recieved date
      echo -e '\t' >> "${file}"
      sed '37q;d' "${f}" | xargs >> "${file}"  # get ballot status
      echo -e '\t' >> "${file}"

      if [[ $(wc -l < "${f}") -gt 70 ]]  # if absentee registered and submitted mail-in ballot
      then
        sed '40q;d' "${f}" | xargs >> "${file}"   # data fields are same
        echo -e '\t' >> "${file}"
        sed '52q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '58q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '64q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '70q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '76q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
      fi
      if [[ $(wc -l < "${f}") -gt 100 ]]  # if absentee registered, recieved mail-in, submitted online mail-in
      then
        sed '79q;d' "${f}" | xargs >> "${file}"  # data fields are same
        echo -e '\t' >> "${file}"
        sed '91q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '97q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '103q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '109q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
        sed '115q;d' "${f}" | xargs >> "${file}"
        echo -e '\t' >> "${file}"
      fi

  echo -e '\n' >> "${file}"
  done
done < /mnt/orangefs/team3/jobs/counties.txt
