# WGS bioinfo with NUS-HPC

This repository includes shell files for submitting tasks to NUS-HPC


## Setup

Set working directory to a temporate path of 500G (all files will be deleted after 60 days).

Check available software packages available in HPC modules.

Create Conda environment if necessary.

```bash
module load miniconda
conda create --name XX
source activate XX
```

Conda environments take space in your home directory (50GB only)!! Please do housekeeping and remove obsolete environments regularly.

Install any software packages or versions of software packages you need but not available in HPC modules.

Configure the software packages if needed.

Upload raw reads.

Upload reference genome.

We adopted pipeline with snakemake, which has been installed in HPC. To activate:

```bash
source /app1/ebenv
module load snakemake/7.22.0-foss-2022a && python -c "import snakedeploy"
```

For more information:
https://snakemake.readthedocs.io/en/stable/index.html

We are following variant calling with GATK pipeline (using bcftools is more common?). Please follow the instruction below to deploy:
https://snakemake.github.io/snakemake-workflow-catalog/?usage=snakemake-workflows%2Fdna-seq-gatk-variant-calling

## Contact author

tangqiannus@gmail.com
