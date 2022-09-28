#!/bin/bash
#SBATCH --ntasks-per-node=4
#SBATCH --mem=8000M
#SBATCH --time=0:9:0
#SBATCH --gres=gpu:1

module load gcc cuda python

virtualenv --no-download $SLURM_TMPDIR/venv_cupy
source $SLURM_TMPDIR/venv_cupy/bin/activate
pip install --no-index numpy cupy

python scripts/crunch.py -n 672 --gpu > tg.log &
sleep 2
nvidia-smi
wait

echo Résultats:
grep sec t*.log
