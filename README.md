

[![Snakemake](https://img.shields.io/badge/snakemake-≥6.0.2-brightgreen.svg)](https://snakemake.github.io)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)


Snakemake Workflow for  detection of lncRNA 
=======================================================

This is a snakemake pipeline to differentiate lncRNAs from mRNAs.

The pipeline takes samples in  either **fasta format** or **fastq format** as input. 

The pipeline takes samples with a suffix 'r_1.fq.gz' and 'r_2.fq.gz' if the samples are paired. Or it takes samples with suffix 'fq.gz' if the samples is single-end reads. It also accepts '.fa' reads/ 
Regardless your samples are paired, single-ended or fasta, samples names should be **samples.tsv** without the suffix. 

You can change the name of the input files **samples.tsv** by editing the config file. You will also need to set the **PAIRED** variable in the config file to either TRUE or FALSE. 

### Run the pipeline 

    snakemake -jn 

where n is the number of cores for example for 10 cores use:


    snakemake -j10 

### Use conda 

For less froodiness, use conda:


    snakemake -jn --use-conda 


For example, for 10 cores use: 

    snakemake -j10 --use-conda 

This will pull automatically the same versiosn of tools we used. Conda has to be installed in the system, in addition to snakemake. 


### Dry Run


For a dry run use: 
  
  
    snakemake -j1 -n 


and to print command in dry run use: 

  
    snakemake -j1 -n -p 


### Use Corresponding configfile:


Just update your config file to include all your sample names, edit your interval.list file to include your intervals of interest, your path, etc for example: 

  
    snakemake -j1 --configfile config-WES.yaml 
  
or: 


    snakemake -j1 configfile config-WGS.yaml 


### TODO 

   More tools will be included

### References 

1. Li, A., Zhang, J., & Zhou, Z. (2014). PLEK: a tool for predicting long non-coding RNAs and messenger RNAs based on an improved k-mer scheme. BMC bioinformatics, 15(1), 1-10.
