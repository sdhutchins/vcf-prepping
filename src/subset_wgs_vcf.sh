#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] subset_wgs_vcf
#          Exclude ids 
#          The input vcf file has also not been normalized.
#PBS -N subwgsvcf
#PBS -l select=55:ncpus=1:mem=2560mb
#PBS -l place=free
#PBS -o logs/
#PBS -e logs/

EMAIL=shaurita.d.hutchins@gmail.com

DATA_DIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data
MGAPDIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/mGAP
INFILE=${MGAPDIR}/all_nprcs_rminfo_wgs.vcf.gz
OUTFILE=${MGAPDIR}/all_nprcs_rminfo_wgs_subsetted.vcf.gz
SAMPLES_FILE=${DATA_DIR}/sample_id_lists/exclude_ids_plink_pca.txt

module use /ddn/home3/vallender/software/module_files
module load nprc_project

bcftools view $INFILE -S ^$SAMPLES_FILE -O z -o $OUTFILE -l 9 --threads 50

bcftools index $OUTFILE --threads 50

