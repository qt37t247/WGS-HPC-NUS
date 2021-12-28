# WGS bioinfo with NUS-HPC

This repository includes shell files for submitting tasks to NUS-HPC

## Setup

Set working directory to a temporate path of 500G (all files will be deleted after 60 days).
Check available software packages available in HPC modules.
Install any software packages or versions of software packages you need but not available in HPC modules.
Upload raw reads in folders, each folder for each library.
Upload reference genome.

```bash
cd hpctmp/dbsxxx
module avail
```

## Check reads quality with FastQC

Example file: fqc.sh

Output files can be compiled and visualize with multiqc

## Quality filtering and adapter trimming with Trimmomatic

Example file: trim.sh

## Index reference genome with bwa, samtools and picard 

Example file: reference_index.sh

## Generate alignments with bwa and samtools

Example file: align.sh

## Mark duplicates and build bam index with picard

Example file: picard.sh

## Variants calling (SNPs and indels) with GATK4

Example file: gatk_HC.sh

## Alternative variants calling with GATK3 and ANGSD

Example file: gatk_RA.sh

## Contact author

tangqiannus@gmail.com
