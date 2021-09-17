#!/bin/bash
#SBATCH --array=10-20:5
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

echo Avant: $(date)
echo ' ...' pause de $SLURM_ARRAY_TASK_ID secondes.
sleep $SLURM_ARRAY_TASK_ID
echo Après: $(date)
echo '---'
