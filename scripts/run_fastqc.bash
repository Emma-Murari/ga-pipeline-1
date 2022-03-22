#Use fastqc to run quality control tests on data

#Load fastqc module
module add fastqc/0.11.7

#Set up input and output directories
OUTDIR=results/fastqc_untrimmed_reads
INPUT=data/untrimmed_fastq/*.fastq.gz

#Create output directory if needed
mkdir -p $OUTDIR

#RUN fastqc on all .fastq.gz files in the input directory
fastqc -o $OUTDIR $INPUT
