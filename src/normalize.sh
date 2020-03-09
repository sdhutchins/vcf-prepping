#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] normalize_vcf
#          Normalize vcf files.
#PBS -N normvcf
#PBS -l select=90:ncpus=1:mem=3000mb
#PBS -l place=free
#PBS -j oe
#PBS -o logs
#PBS -e logs

EMAIL=shaurita.d.hutchins@gmail.com
CENTER=${CENTER}
MGAP_DIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/mGAP
infile=${MGAP_DIR}/all_nprcs_rminfo.vcf.gz
outfile=${MGAP_DIR}/all_nprcs_rminfo_norm.vcf.gz
fasta=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/ref_genome/1_Mmul_8.0.1.fasta
echo "VCF normalizing script has started running." | mail -s "VCF Norm Script" $EMAIL

module use /ddn/home3/vallender/software/module_files
module load nprc_project

# Normalize the vcf file by checking snps with the ref genome
# and removing both snp & indel duplicates
bcftools norm $infile -c s -d both -f $fasta -O z -o $outfile --threads 85

# Index the vcf file
bcftools index $outfile --threads 85

echo "VCF normalizing script has completed." | mail -s "VCF Norm Script" $EMAIL
