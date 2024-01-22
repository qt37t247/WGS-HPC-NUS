#!/bin/bash
#PBS -N T2_EM
#PBS -l select=1:ncpus=120:mem=180G:mpiprocs=120:ompthreads=120
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -o out-run.txt
#PBS -q normal

module load miniforge3
conda activate snparcher
conda activate snparcherx

cd /scratch/users/nus/dbstq/T2_EM/
snakemake -s /scratch/users/nus/dbstq/snpArcher/workflow/Snakefile -d /scratch/users/nus/dbstq/T2_EM/ --cores 120 --use-conda
