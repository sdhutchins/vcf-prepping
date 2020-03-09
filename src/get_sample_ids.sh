#!/bin/bash

MGAPDIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/mGAP
SAMPLEIDDIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/sample_id_lists

vcf_array=(`cat $MGAPDIR/vcf_files.txt`)

for vcf in "${vcf_array[@]}"; do
  filename=`echo "$vcf" | sed "s/.*\///"`
  nprc="$(cut -d'_' -f1 <<<"$filename")"
  textfile=`echo "$SAMPLEIDDIR"/"$nprc"_sample_ids.txt`
  echo "Querying $filename"
  bcftools query -l $vcf >> $textfile
done

cat $SAMPLEIDDIR/*_sample_ids.txt > $SAMPLEIDDIR/all_sample_ids.txt