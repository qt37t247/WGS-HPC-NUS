#!/bin/bash
#PBS -q parallel12
#PBS -l select=1:ncpus=12:mem=45GB
#PBS -l walltime=500:00:00
#PBS -j oe

cd $PBS_O_WORKDIR
source /etc/profile.d/rec_modules.sh
module load fastqc
module load python3.6.4

cd /hpctmp/<NUSID>/<PROJECT>
mkdir fastqc
fastqc *.fq.gz -t 12 -o /hpctmp/<NUSID>/<PROJECT>/fastqc

