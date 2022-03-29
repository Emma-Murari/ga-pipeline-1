#This is a wrapper for the trimmomatic tool on AGAVE
#To load trimmomatic: module add trimmomatic/0.33
#Example command: bash trimmomatic.bash PE SRR2589044_1.fastq.gz SRR2589044_2.fastq.gz SRR2589044_1_trim.fastq.gz SRR2589044_1_1un.fastq.gz SRR2589044_2_trim.fastq.g
#z SRR2589044_2_1un.fastq.gz SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15
#TrimmomaticPE: Started with arguments: SRR2589044_1.fastq.gz SRR2589044_2.fastq.gz SRR2589044_1_trim.fastq.gz SRR2589044_1_1un.fastq.gz SRR2589044_2_
#trim.fastq.gz SRR2589044_2_1un.fastq.gz SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15


#Load module
module purge
module add trimmomatic/0.33

infile="$1"
outdir="$2"

mkdir -p "$outdir"

#Trim Jar
TRIM_BIN=java -jar /packages/7x/trimmomatic/0.33/trimmomatic.jar 
TRIM_ARGS="SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:scripts/NexteraPE-PE.fa:2:40:15" 


#This is a for loop that will allow the user to trim multiple sets of paired end reads

#Create basename
base=$(basename "${infile}" _1.fastq.gz)
indir=$(dirname "${infile}")

#Run Trimmomatic
$TRIM_BIN PE "${indir}/${base}_1.fastq.gz" "${indir}/${base}_2.fastq.gz" \
                "${indir}/${base}_1.trim.fastq.gz" "${indir}/${base}_1un.trim.fastq.gz" \
                "${indir}/${base}_2.trim.fastq.gz" "${indir}/${base}_2un.trim.fastq.gz" \
		${TRIM_ARGS}
 
