#!/bin/bash
#PBS -N T2_EM
#PBS -l select=1:ncpus=12:mem=45G:mpiprocs=12:ompthreads=12
#PBS -l walltime=120:00:00
#PBS -j oe
#PBS -o out-run.txt
#PBS -P T2_EM
#PBS -q normal

module load miniforge3
source activate snparcher

cd /scratch/users/nus/dbstq/T2_MW/
snakemake -s /scratch/users/nus/dbstq/snpArcher/workflow/Snakefile -d /scratch/users/nus/dbstq/T2_EM --cores 12 --use-conda
