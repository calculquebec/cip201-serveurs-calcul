#!/bin/bash

#SBATCH --job-name=myjob
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1G
#SBATCH --time=00:05:00

module load StdEnv/2023 gcc/12.3

srun my-openmp-prog arg1 arg2
