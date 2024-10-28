#!/bin/bash
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

module load gcc/12.3 cuda/12.2

export Dim=5760

~/cuda-samples-11.0/bin/x86_64/linux/release/matrixMul \
  -wA=$Dim -hA=$Dim -wB=$Dim -hB=$Dim
