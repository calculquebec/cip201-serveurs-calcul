#!/bin/bash

#SBATCH --job-name=myjob
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=1G
#SBATCH --time=00:05:00

module load StdEnv/2023 gcc/12.3 openmpi/4.1.5

srun my-mpi-prog arg1 arg2
