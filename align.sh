#!/bin/bash
#PBS -q parallel12
#PBS -l select=1:ncpus=12:mem=45GB
#PBS -l walltime=500:00:00
#PBS -j oe

cd $PBS_O_WORKDIR
source /etc/profile.d/rec_modules.sh
module load jre/1.8.0_162
module load bwa/0.7.17
module load samtools

cd /hpctmp/<NUSID>/<PROJECT>
for i in *_1_paired.fq.gz
do 
base=${i%_1_paired*}
bwa mem -t 12 -p -M -R "@RG\tID:<LANE#>\tLB:${base}\tPL:ILLUMINA\tPM:HISEQ\tSM:${base}" <REFERENCE_GENOME_FILE> \
"${base}_1_paired.fq.gz" "${base}_2_paired.fq.gz" | \
samtools view -bhq 20 -@ 11| \
samtools sort -@ 11 -o "/hpctmp/<NUSID>/<PROJECT>/${base}.bam"
done

for i in *_sorted.bam
do 
java -Xmx45g -jar /hpctmp/dbstq/test_fresh/picard.jar MarkDuplicates I="$i" O="dedup_$i" M="metrics_$i.txt"
java -Xmx45g -jar /hpctmp/dbstq/test_fresh/picard.jar BuildBamIndex I="dedup_$i" O="dedup_$i.bai"
done
