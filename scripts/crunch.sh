#!/bin/bash

if [ -z "$SLURM_TMPDIR" ]; then
  echo "Erreur: ce script doit être utilisé à partir d'un noeud de calcul."
  echo "Vous devez d'abord lancer la commande salloc avant $0"
  exit
fi

SYNTAXE="Syntaxe: bash $0 --cpu|--gpu [1|4]"

if [ "$#" -lt 1 ]; then
  echo $SYNTAXE
  exit
fi

if [ "$1" = '--cpu' ]; then
  if ! [ "$2" = 1 ] && ! [ "$2" = 4 ]; then
    echo Erreur: le second paramètre doit être 1 ou 4
    echo $SYNTAXE
    exit
  fi

  module load StdEnv/2023 gcc/12.3 python/3.11

  virtualenv --no-download $SLURM_TMPDIR/venv_numpy
  source $SLURM_TMPDIR/venv_numpy/bin/activate
  pip install --no-index numpy==1.26.4

  export OMP_NUM_THREADS=$2
  time -p python $(dirname $0)/crunch.py -n 672 --cpu > t$2.log &
  echo "C'est parti!"

elif  [ "$1" = '--gpu' ]; then
  module load StdEnv/2023 gcc/12.3 cuda/12.2 python/3.11

  virtualenv --no-download $SLURM_TMPDIR/venv_cupy
  source $SLURM_TMPDIR/venv_cupy/bin/activate
  pip install --no-index numpy==1.26.4 cupy==12.2.0

  time -p python $(dirname $0)/crunch.py -n 672 --gpu > tg.log &
  echo "C'est parti!"

else
  echo Erreur: le premier paramètre doit être --cpu ou --gpu
  echo $SYNTAXE
fi
