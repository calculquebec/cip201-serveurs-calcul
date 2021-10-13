#!/bin/bash
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

echo Avant: $(date)
sleep 300
echo Après: $(date)
