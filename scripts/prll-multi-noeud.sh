#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=2000M

scontrol show hostname > noeuds.txt
cat noeuds.txt

parallel --jobs $SLURM_NTASKS_PER_NODE --sshloginfile noeuds.txt \
    'echo -n {}: && hostname' ::: $(seq 1 $SLURM_NTASKS)
