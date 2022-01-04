#!/bin/bash
#PBS -q parallel12
#PBS -l select=4:ncpus=12:mem=45GB
#PBS -l walltime=500:00:00
#PBS -j oe

cd $PBS_O_WORKDIR
source /etc/profile.d/rec_modules.sh
module load bwa/0.7.17
module load samtools

cd /hpctmp/<NUSID>/<PROJECT>
for i in *_1_paired.fq.gz
do 
base=${i%_1_paired*}
bwa mem -M -R "@RG\tID:<LANE#>\tLB:${base}\tPL:ILLUMINA\tPM:HISEQ\tSM:${base}" <REFERENCE_GENOME_FILE> \
"${base}_1_paired.fq.gz" "${base}_2_paired.fq.gz" | \
samtools view -bhq 20 | \
samtools sort -m 16G -o "/hpctmp/<NUSID>/<PROJECT>/${base}.bam"
done

