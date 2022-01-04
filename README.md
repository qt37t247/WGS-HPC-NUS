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

Upload the zipped file of latest version of Trimmomatic, which can be download at:

http://www.usadellab.org/cms/?page=trimmomatic

unzip with

```bash
unzip Trimmomatic-vxxx.zip
```

A folder will be created named "Trimmomatic-vxxx", where the .fa files of adapters are stored.

Output files include log files. 90% reads to the "paired" fq files consider acceptable. 

Too many unpaired reads indicate shorter inserts than expected (acceptable for ancient samples).

If so, consider to trim as single-ended read with the option "SE" in the Trimmomatic.

Single-ended reads should be "bbrenamed" before proceeding to the alignment procedure.


## Index reference genome with bwa, samtools and picard 

Example file: reference_index.sh

Upload the reference genome file to the working directory (unzip if the file is compressed).


## Generate alignments with bwa and samtools

Example file: align.sh


## Mark duplicates and build bam index with picard

Example file: picard.sh

By the end of this step you may consider directly calling variants with GATK4 without re-alignment (use the gatk_HC.sh). Runtime for each sample may exceed a week. 


## Indel realignment and variants calling with ANGSD

Example file: gatk_RA.sh


## Contact author

tangqiannus@gmail.com
