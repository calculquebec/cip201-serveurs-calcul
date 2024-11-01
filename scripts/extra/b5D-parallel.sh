#!/bin/bash
#SBATCH
#SBATCH
#SBATCH --time=0-00:20

module load StdEnv/2023 gcc/12.3

cd $SLURM_TMPDIR
cp $HOME/cq-formation-benchmark5D/solutions/b5D.omp ./

export OMP_NUM_THREADS=1

echo "validité,vitesse,algorithme,N,b1,b2,b3,p1,p2,p3,k,répétitions"
./b5D.omp -a vect -b -n 96 \
  -b1 {} -b2 {} -b3 {} -p1 {} -p2 {} -p3 {} \
  :::  | grep Result | sort -t, -n -k2,2
