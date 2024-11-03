#!/bin/bash

#SBATCH --job-name=pi
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=1G
#SBATCH --time=00:05:00

module load StdEnv/2023 gcc/12.3 openmpi/4.1.5

srun ./pi 10000000000
