#!/bin/bash
#
#SBATCH --job-name=genelengths
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=genelengths.out # File to which STDOUT will be written
#SBATCH --error=genelengths.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=08:00:00

set -e                                                                                  # Error if a single command fails
set -u                                                                                  # Error if un-named variables calledset -x  >
set -x

module load conda/latest
conda activate exp2

gtftools -l rrgenelengths.tsv ../Genome/farr1.gene_models_updated_2025-04-15.gtf -c _1A,_1B,_1C,_1D,_2A,_2B,_2C,_2D,_3A,_3B,_3C,_3D,_4A,_4B,_4C,_4D,_5A,_5B,_5C,_5D,_6A,_6B,_6C,_6D,_7A,_7B,_7C,_7D,contig_01,contig_02,contig_03,contig_04,contig_05,contig_06,contig_07,contig_08,contig_09,contig_10,contig_11,contig_12,contig_13,contig_14,contig_15,contig_16,contig_17,contig_18,contig_19,contig_20
