# WGS bioinfo with NUS-HPC

This repository includes shell files for submitting tasks to NUS-HPC


## Setup

Set working directory to a temporate path of 500G (all files will be deleted after 60 days).

Check available software packages available in HPC modules.

Install any software packages or versions of software packages you need but not available in HPC modules.

Upload raw reads in folders, each folder for each lane.

Upload reference genome.

```bash
cd hpctmp/dbsxxx
module avail
```

For some example shell files, I submit them to parallel12. If you submit to other queues (e.g. parallel24), please change threads (normally specified after the flag "-t" or "-c") used in the program accordingly to make the full use of your HPC quota.  


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

Somehow the picard in HPC is not working. Download the "picard.jar" and upload to your working directory

https://broadinstitute.github.io/picard/

Upload the reference genome file to the working directory (unzip if the file is compressed).


## Generate alignments with bwa, samtools and picard

Example file: align.sh

The outputs are sorted bam files with duplicates marked (dedup_SAMPLE_NAME_sorted.bam) and bam index files (dedup_SAMPLE_NAME_sorted.bam.bai).


## Variant calling with GATK4 (testing speed at the moment) 

Example file: gatk4.sh

Three vcf files per sample generated, namely raw vcf, SNP vcf and indel vcf.

A flagstat.txt file to summarize alignment stats of all samples.


## Contact author

tangqiannus@gmail.com
