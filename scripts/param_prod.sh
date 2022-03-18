#!/bin/bash
#SBATCH --time=0:5:0
#SBATCH --mem=1000M

parallel -C ' ' echo '{1}*{2} | bc > prod_{1}x{2}' :::: param.txt
grep -E '[0-9]+' prod*
