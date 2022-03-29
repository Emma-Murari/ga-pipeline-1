metadata=data/untrimmed_fastq/data_urls.txt
outdir=data/bam
infiles=$(cut -d' ' -f 1 $metadata | grep _1.fastq.gz)
indir=data/trimmed_fastq

for filename in $infiles do
  sbatch scripts/trimmomatic.bash $indir/$filename $outdir
done


#incomplete: finish this as homework
#note to self: get trimming setup to work first - look at notes from class to help
