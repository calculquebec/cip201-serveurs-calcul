#!/bin/bash
#SBATCH
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

module load gcc/12.3 &> /dev/null

cd $SLURM_TMPDIR
cp $HOME/cq-formation-benchmark5D/solutions/b5D.omp ./

export OMP_NUM_THREADS=1

echo "validité,vitesse,algorithme,N,b1,b2,b3,p1,p2,p3,k,répétitions"
 2> /dev/null | \
  grep -v master | sort -t, -n -k2,2
