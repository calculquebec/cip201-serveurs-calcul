#!/bin/bash
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

module load gcc cuda

~/cuda-samples-11.0/bin/x86_64/linux/release/UnifiedMemoryPerf
