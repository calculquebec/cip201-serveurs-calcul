#!/bin/bash
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

module load StdEnv/2023 gcc/12.3 blast+/2.14.1 seqkit/2.5.1 glost/0.3.1 meta-farm/1.0.2

mkdir -p $SCRATCH/res_meta

task.run
