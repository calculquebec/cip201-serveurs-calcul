#!/bin/bash
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

module load gcc &> /dev/null

cd $SLURM_TMPDIR
cp $HOME/cq-formation-benchmark5D/solutions/b5D.omp ./

export OMP_NUM_THREADS=1

echo "validité,vitesse,algorithme,N,b1,b2,b3,p1,p2,p3,k,répétitions"
parallel ./b5D.omp -a vect -b -n 96 \
  -b1 {1} -b2 {1} -b3 {1} -p1 {2} -p2 {2} -p3 {2} \
  ::: 48 32 24 ::: 16 12 8 6 | grep Result | sort -t, -n -k2,2
