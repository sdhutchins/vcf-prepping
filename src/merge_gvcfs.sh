#!/bin/bash

MGAPDIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/mGAP
GENOMEDIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/ref_genome

# Save list of new files
find $MGAPDIR -type f -iname "*_nocln.vcf.gz" > $MGAPDIR/nocln_vcf_files.txt

# Merging gvcf files
echo "Merging vcf files..."
bcftools merge -l $MGAPDIR/nocln_vcf_files.txt -g $GENOMEDIR/1_Mmul_8.0.1.fasta -o $MGAPDIR/all_nprcs.vcf.gz -O z --threads 40
