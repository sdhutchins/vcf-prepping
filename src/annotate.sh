#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] annotate
#          Filter unnecessary ids from main vcf.
#PBS -N annotate
#PBS -l select=45:ncpus=1:mem=8000mb
#PBS -l place=free
#PBS -j oe
#PBS -o logs
#PBS -e logs


MGAP_DIR=/ddn/home3/vallender/projects/NPRC_Pedigree_Project/data/mGAP
VCF=${MGAP_DIR}/all_nprcs.vcf.gz
IDS=INFO/ANN,INFO/CADD_PH,INFO/CADD_RS,INFO/CCDS,INFO/ENC,INFO/ENCDNA_CT,INFO/ENCDNA_SC,INFO/ENCSEG_CT,INFO/ENCSEG_NM,INFO/ENCTFBS_CL,INFO/ENCTFBS_SC,INFO/ENCTFBS_TF,INFO/ENN,INFO/ERBCTA_CT,INFO/ERBCTA_NM,INFO/ERBCTA_SC,INFO/ERBSEG_CT,INFO/ERBSEG_NM,INFO/ERBSEG_SC,INFO/ERBSUM_NM,INFO/ERBSUM_SC,INFO/ERBTFBS_PB,INFO/ERBTFBS_TF,INFO/FC,INFO/FE,INFO/FS_EN,INFO/FS_NS,INFO/FS_SC,INFO/FS_SN,INFO/FS_TG,INFO/FS_US,INFO/FS_WS,INFO/GRASP_AN,INFO/GRASP_P,INFO/GRASP_PH,INFO/GRASP_PL,INFO/GRASP_PMID,INFO/GRASP_RS,INFO/LF,INFO/LOF,INFO/NC,INFO/NE,INFO/NF,INFO/NG,INFO/NH,INFO/NJ,INFO/NK,INFO/NL,INFO/NM,INFO/NMD,INFO/OMIMC,INFO/OMIMD,INFO/OMIMM,INFO/OMIMMUS,INFO/OMIMN,INFO/OMIMS,INFO/OMIMT,INFO/OREGANNO_PMID,INFO/OREGANNO_TYPE,INFO/PC_PL,INFO/PC_PR,INFO/PC_VB,INFO/PP_PL,INFO/PP_PR,INFO/PP_VB,INFO/RDB_MF,INFO/RDB_WS,INFO/RFG,INFO/RSID,INFO/SCSNV_ADA,INFO/SCSNV_RS,INFO/SD,INFO/SF,INFO/SM,INFO/SP_SC,INFO/SX,INFO/TMAF,INFO/CLN_ALLELE,INFO/CLN_ALLELEID,INFO/CLN_DBVARID,INFO/CLN_DISDB,INFO/CLN_DISDBINCL,INFO/CLN_DN,INFO/CLN_DNINCL,INFO/CLN_GENEINFO,INFO/CLN_HGVS,INFO/CLN_MC,INFO/CLN_ORIGIN,INFO/CLN_REVSTAT,INFO/CLN_RS,INFO/CLN_SIG,INFO/CLN_SIGINCL,INFO/CLN_SSR,INFO/CLN_VC,INFO/CLN_VCSO,INFO/CLN_VI
OUTFILE=${MGAP_DIR}/all_nprcs_rminfo.vcf.gz

bcftools annotate $VCF -x $IDS -O z -o $OUTFILE --threads 40

bcftools index $OUTFILE --threads 40
