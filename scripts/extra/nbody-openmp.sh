#!/bin/bash
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

module load StdEnv/2023 gcc/12.3

cd $SLURM_TMPDIR
cp $HOME/cq-formation-nbody/solutions/openmp/{nbody_omp,parameters.txt} ./

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
duree=$(2>&1 time -p ./nbody_omp parameters.txt | grep -E '^real')
duree=$(echo $duree | cut -d' ' -f2)

md5sum -c $HOME/cq-formation-nbody/solutions/md5/rkutta_parameters_txt.md5
echo "Temps écoulé: $duree sec. avec $OMP_NUM_THREADS processeur(s)"
