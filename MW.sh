#!/bin/bash

#$ -cwd

#PBS -q parallel12
#PBS -l select=1:cluster=tiger2:ncpus=12:mpiprocs=12:mem=45GB:ompthreads=12
#PBS -l walltime=500:00:00
#PBS -j oe

#$ -N j1P_18
#$ -o MW.out
#$ -e MW.err
#$ -m a

source /etc/profile.d/rec_modules.sh
module load miniconda
source activate snparcher

cd /hpctmp/dbstq/T2_MW/
snakemake -s /hpctmp/dbstq/snpArcher/workflow/Snakefile -d /hpctmp/dbstq/T2_MW --cores 12 --use-conda
