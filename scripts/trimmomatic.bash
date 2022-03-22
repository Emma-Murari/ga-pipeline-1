#This is a wrapper for the trimmomatic tool on AGAVE
#To load trimmomatic: module add trimmomatic/0.33
#Example command: bash trimmomatic.bash PE SRR2589044_1.fastq.gz SRR2589044_2.fastq.gz SRR2589044_1_trim.fastq.gz SRR2589044_1_1un.fastq.gz SRR2589044_2_trim.fastq.g
#z SRR2589044_2_1un.fastq.gz SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15
#TrimmomaticPE: Started with arguments: SRR2589044_1.fastq.gz SRR2589044_2.fastq.gz SRR2589044_1_trim.fastq.gz SRR2589044_1_1un.fastq.gz SRR2589044_2_
#trim.fastq.gz SRR2589044_2_1un.fastq.gz SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15


#Load module
module add trimmomatic/0.33

TRIM_BIN=java -jar /packages/7x/trimmomatic/0.33/trimmomatic.jar "$@"



#This is a for loop that will allow the user to trim multiple sets of paired end reads
#This requires the use of the trimmomatic wrapper trimmomatic.bash

base=$(basename ${base} _1.fastq.gz)

TRIM_BIN PE ${base}_1.fastq.gz ${base}_2.fastq.gz \
                ${base}_1.trim.fastq.gz ${base}_1un.trim.fastq.gz \
                ${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
                SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15 
 done
