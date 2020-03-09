#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] remove exome data
#          Filter exome and gbs only samples from main vcf.
#PBS -N rmexome
#PBS -l select=50:ncpus=1:mem=2000mb
#PBS -l place=free
#PBS -j oe
#PBS -o logs
#PBS -e logs


echo "Remove exome/gbs data script has started running." | mail -s "Remove Exome/GBS Script Status" shaurita.d.hutchins@gmail.com

DATA=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data
VCF=${DATA}/mGAP/all_nprcs_rminfo.vcf.gz
OUTFILE=${DATA}/mGAP/all_nprcs_rminfo_wgs.vcf.gz
SAMPLES_FILE=${DATA}/metadata/wgs_ids.txt

module use /ddn/home3/vallender/software/module_files
module load nprc_project

bcftools view $VCF -S $SAMPLES_FILE -O z -o $OUTFILE --threads 45

bcftools index $OUTFILE --threads 45

echo "Remove exome/gbs data script has stopped running." | mail -s "Remove Exome/GBS Script Status" shaurita.d.hutchins@gmail.com
