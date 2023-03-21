#!/bin/bash
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

module load gcc/9.3.0 blast+/2.12.0 seqkit/0.15.0 glost/0.3.1 meta-farm/1.0.2
export BLAST_USAGE_REPORT=false  # Éviter les communications

mkdir -p $SCRATCH/res_meta

task.run
