#!/bin/bash

# Wrapper Script for Trimmomatic
#   USAGE: bash trimmomatic.bash PATH/TO/INPUT_1.fastq.gz PATH/TO/OUTPUT/DIR

# Load Module
module purge
module add trimmomatic/0.33

# Store script arguments to variables
infile="$1"
outdir="$2"

# Create output directory if neccessary
mkdir -p "$outdir"

# Trimmomatic's path and arguments
TRIM_BIN="java -jar /packages/7x/trimmomatic/0.33/trimmomatic.jar"
TRIM_ARGS="SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:scripts/NexteraPE-PE.fa:2:40:15"

# Find the basename and input directory of our input file
base=$(basename "${infile}" _1.fastq.gz)
indir=$(dirname "${infile}")

# Run Trimmomatic
$TRIM_BIN PE "${indir}/${base}_1.fastq.gz" "${indir}/${base}_2.fastq.gz" \
  "${outdir}/${base}_1.trim.fastq.gz" "${outdir}/${base}_1un.trim.fastq.gz" \
  "${outdir}/${base}_2.trim.fastq.gz" "${outdir}/${base}_2un.trim.fastq.gz" \
  $TRIM_ARGS
