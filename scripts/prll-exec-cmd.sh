#!/bin/bash
#SBATCH --cpus-per-task=2
#SBATCH --mem=1000M
#SBATCH --time=0:5:0

parallel < scripts/cmd.txt
grep -E '[0-9]+' prod_*
