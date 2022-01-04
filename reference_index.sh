#!/bin/bash
#PBS -q parallel12
#PBS -l select=4:ncpus=12:mem=45GB
#PBS -l walltime=500:00:00
#PBS -j oe

cd $PBS_O_WORKDIR
source /etc/profile.d/rec_modules.sh
module load picard/2.16
module load bwa/0.7.17
module load samtools

cd /hpctmp/<NUSID>/
bwa index <REFERENCE_GENOME_FILE>
samtools faidx <REFERENCE_GENOME_FILE>
picard CreateSequenceDictionary R=<REFERENCE_GENOME_FILE> O=<REFERENCE_GENOME_FILE.dict>
