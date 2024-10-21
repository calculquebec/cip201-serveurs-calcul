#!/bin/bash
#SBATCH --cpus-per-task=2
#SBATCH --mem=1000M
#SBATCH --time=0:5:0

parallel -C ' ' echo '$(({1}*{2})) > prod_{1}x{2}' :::: scripts/param.txt
grep -E '[0-9]+' prod_*
