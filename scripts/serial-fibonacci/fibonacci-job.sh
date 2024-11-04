#!/bin/bash

#SBATCH --job-name=fibo
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00

module load StdEnv/2023 gcc/12.3

srun ./fibonacci 50
