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
bwa index <REFERENCE_GENOME_FILE>
samtools faidx <REFERENCE_GENOME_FILE>
java -Xmx45g -jar /hpctmp/<NUSID>/<PROJECT>/picard.jar CreateSequenceDictionary R=<REFERENCE_GENOME_FILE> O=<REFERENCE_GENOME_FILE.dict>
