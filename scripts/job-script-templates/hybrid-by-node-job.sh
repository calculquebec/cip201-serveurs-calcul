#!/bin/bash

#SBATCH --job-name=myjob
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1G
#SBATCH --time=00:05:00

export OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}"

module load StdEnv/2023 gcc/12.3 openmpi/4.1.5

srun my-hybrid-prog arg1 arg2
