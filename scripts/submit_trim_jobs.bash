# Trimmomatic job submission script
# Setup variables
metadata=data/untrimmed_fastq/data_urls.txt
indir=data/untrimmed_fastq
infiles=$(cut -d' ' -f 1 $metadata | grep _1.fastq.gz)
outdir=data/trimmed_fastq

# Submit one job per input file
for filename in $infiles; do
  sbatch scripts/trimmomatic.bash $indir/$filename $outdir
done
