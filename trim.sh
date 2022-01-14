#!/bin/bash
#PBS -q parallel12
#PBS -l select=1:ncpus=12:mem=45GB
#PBS -l walltime=500:00:00
#PBS -j oe

cd /hpctmp/<NUSID>/<PROJECT>
for i in *_1.fq.gz
do base = ${i%_1.fq.gz*}
java -jar ./<Trimmomatic-vxxx>/<trimmomatic-vxxx>.jar PE -threads 12 -phred33 -trimlog "$base"_trim.log "$base"_1.fq.gz "$base"_2.fq.gz "$base"_1_paired.fq.gz "$base"_2_paired.fq.gz "$base"_1_unpaired.fq.gz "$base"_2_unpaired.fq.gz ILLUMINACLIP:./<Trimmomatic-vxxx>/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
