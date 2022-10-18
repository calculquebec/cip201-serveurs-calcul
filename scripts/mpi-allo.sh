#!/bin/bash
#SBATCH --ntasks=10
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=0-00:10

module load gcc/9.3.0 &> /dev/null

mpirun printenv HOSTNAME OMPI_COMM_WORLD_RANK OMPI_COMM_WORLD_SIZE
