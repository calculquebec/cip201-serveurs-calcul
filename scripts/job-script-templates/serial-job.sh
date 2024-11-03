#!/bin/bash

#SBATCH --job-name=myjob
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00

module load StdEnv/2023 gcc/12.3

srun my-serial-prog arg1 arg2
