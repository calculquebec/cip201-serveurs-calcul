#!/bin/bash

#SBATCH --job-name=myjob
#SBATCH --array=1-4
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00

module load StdEnv/2023 gcc/12.3 python/3.11.5 scipy-stack/2024b

mkdir -p results
output_filename="results/distrib-${SLURM_ARRAY_TASK_ID}.csv"

srun python3 ./distrib.py "${output_filename}"
