#!/bin/bash

# Wrapper Script for Trimmomatic
#   USAGE: bash trimmomatic.bash PATH/TO/INPUT_1.fastq.gz PATH/TO/OUTPUT/DIR

<<<<<<< HEAD
#SBATCH -N 1  # number of nodes
#SBATCH -n 1  # number of "tasks" (default: allocates 1 core per task)
#SBATCH -t 0-00:10:00   # time in d-hh:mm:ss
#SBATCH -p serial       # partition 
#SBATCH -q normal       # QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=YOUR-EMAIL-ADDRESS # Mail-to address
#SBATCH --export=NONE   # Purge the job-submitting shell environment

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









=======
>>>>>>> b25c01faee650fb19ca28101ec2975c2c94d8998
