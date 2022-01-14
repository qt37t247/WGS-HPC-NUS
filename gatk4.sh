#!/bin/bash
#PBS -q parallel24
#PBS -l select=1:ncpus=24:mem=180GB
#PBS -l walltime=720:00:00
#PBS -j oe

cd $PBS_O_WORKDIR
source /etc/profile.d/rec_modules.sh
module load gatk
module load samtools
module load python3.6.4

cd /hpctmp/<NUSID>/<PROJECT>
( for i in dedup_*_sorted.bam ; do printf $i; printf "\n"; samtools flagstat -@24 $i ; done) > flagstat.txt

for i in dedup_*_sorted.bam
do 
gatk --java-options "-XX:+UseParallelGC -XX:ParallelGCThreads=24 -Xmx180g" HaplotypeCaller -R /hpctmp/dbstq/test_fresh/Leiothrix_genomic.fna -I "$i" --native-pair-hmm-threads 24 -O "$i_raw.vcf"
done

for i in *_raw.vcf
do 
gatk --java-options "-XX:+UseParallelGC -XX:ParallelGCThreads=24 -Xmx180g" SelectVariants -R /hpctmp/dbstq/test_fresh/Leiothrix_genomic.fna -V "$i" -select-type SNP -O "$i_snp.vcf"
done

for i in *_raw.vcf
do 
gatk --java-options "-XX:+UseParallelGC -XX:ParallelGCThreads=24 -Xmx180g" SelectVariants -R /hpctmp/dbstq/test_fresh/Leiothrix_genomic.fna -V "$i" -select-type INDEL -O "$i_indel.vcf"
done
