

while read cnty; do
  echo "$cnty"
  file="${cnty}-ballot-out.csv"
  echo "" > "${file}"
  for f in ./*-"${cnty}".html.clean; do
      sed '1q;d' "${f}" | xargs >> "${file}"
      echo -e '\t' >> "${file}"
      sed '13q;d' "${f}" | xargs >> "${file}"
      echo -e '\t' >> "${file}"
      sed '19q;d' "${f}" | xargs >> "${file}"
      echo -e '\t' >> "${file}"
      sed '25q;d' "${f}" | xargs >> "${file}"
      echo -e '\t' >> "${file}"
      sed '31q;d' "${f}" | xargs >> "${file}"
      echo -e '\t' >> "${file}"
      sed '37q;d' "${f}" | xargs >> "${file}"
      echo -e '\t' >> "${file}"

      if [[ $(wc -l < "${f}") -gt 70 ]]
      then
        sed '40q;d' "${f}" | xargs >> "${file}"
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
      if [[ $(wc -l < "${f}") -gt 100 ]]
      then
        sed '79q;d' "${f}" | xargs >> "${file}"
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
