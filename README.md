# WGS bioinfo with NUS-HPC

This repository includes example files for submitting tasks to NUS-HPC and NSCC (National Supercomupting Singapore).

The variant calling protocol generally follows the automated pipeline "snpArcher" (Mirchandani et al., 2023), empowered by snakemake. 
https://github.com/harvardinformatics/snpArcher


## Setup

Create a conda environment for snakemake and snparcher.

Then install snparcher to your "hpctmp" of 500G (request to get maximum 2TB for free).

```bash
module load miniconda
# module load miniforge3 #(if use NSCC)
conda create --name snparcher
source activate snparcher
conda install -c bioconda snakemake
cd /hpctmp/dbstq/
# cd /scratch/users/nus/dbstq/ #(if use NSCC)
git clone https://github.com/harvardinformatics/snpArcher.git
```


By the end, you will have a folder named "snpArcher" under your "hpctmp".

Conda environments take space in your home directory (50GB only)!! Please do housekeeping and remove obsolete environments regularly.


## Start a project

For each project (normally a species/species complex sharing the same reference genome), create a project folder and copy the "config" folder.

```
mkdir projectX
mkdir projectX/data
mkdir projectX/results
cp snpArcher/config projectX -r
```


By the end, in your "hpctmp", you will have the following directory structure:

```
├── snpArcher
├── project_1/
│   ├── project1.sh
│   ├── config/
│   │   ├── config.yaml
│   │   ├── resources.yaml
│   │   └── samples.csv
│   ├── data
│   │   ├── ref_genome/
│   │   │   ├── ././ref_genome.fna
│   │   ├── sample1_1.fq.gz
│   │   ├── sample1_2.fq.gz
│   │   ├── sample2_1.fq.gz
│   │   ├── sample2_2.fq.gz
│   └── results
└── project_2/
    ├── project2.sh
    ├── config/
    │   ├── config.yaml
    │   ├── resources.yaml
    │   └── samples.csv
    └── data
```


Upload raw reads and reference genome to the "projectX/data" folder.


Edit the sample file (samples.csv) and configuration files (config.yaml and resources.yaml) in "projectX/config". 


Create a shell file to submit job. For detailed instruction, please see:
https://snparcher.readthedocs.io/en/latest/executing.html#cluster-execution


Please note that the pipeline may need access to the Internet, so use cluster "gold" or "tiger2" in the hpc. 

Use command
```
gstat
```
to check the availability of the clusters.


Finally, when everything is set, run:
```
qsub projectX.sh
```

## References

Mirchandani, C. D., Shultz, A. J., Thomas, G. W., Smith, S. J., Baylis, M., Arnold, B., ... & Sackton, T. B. (2023). A fast, reproducible, high-throughput variant calling workflow for population genomics. Molecular Biology and Evolution, msad270.


## Acknowledgements

“We would like to acknowledge that computational work involved in this research work is partially/fully supported by NUS IT’s Research Computing group using grant numbers NUSREC-HPC-00001”.


## Contact author

tangqiannus@gmail.com
