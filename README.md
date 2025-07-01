# RPKM: Normalized Expression from Public RNAseq Data

This repository contains scripts written for the creation of a gene expression atlas in strawberry, for the purpose of analyzing expression of candidate susceptibility genes. However, the scripts can be modified to get rpkm data for any gene. Workflow steps and associated scripts are listed below.

## Creating conda environment
1. condaenv.sh
## Obtaining publicly available data
1. getdata.sh
2. fastq.sh 
## Checking data quality
1. fastqc.sh
2. fastqcunzip.sh
3. trim.sh
## Generating count table
1. starindex.sh
2. starmap.sh
3. convert.sh
4. countall.sh
## Calculating normalized expression (RPKM)
1. genelengths.sh 
2. calcexp.sh
## Visualization
1. filterrpkm.sh
2. visualize_rpkm.sh
