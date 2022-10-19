#!/bin/bash

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

  module load gcc/9.3.0 python/3.8.10 &> /dev/null
  source $SLURM_TMPDIR/venv_numpy/bin/activate

  export OMP_NUM_THREADS=$2
  python $(dirname $0)/crunch.py -n 672 --cpu > t$2.log &
  echo "C'est parti!"

elif  [ "$1" = '--gpu' ]; then
  module load gcc/9.3.0 cuda/11.4 python/3.8.10 &> /dev/null
  source $SLURM_TMPDIR/venv_cupy/bin/activate

  python $(dirname $0)/crunch.py -n 672 --gpu > tg.log &
  echo "C'est parti!"

else
  echo Erreur: le premier paramètre doit être --cpu ou --gpu
  echo $SYNTAXE
fi
