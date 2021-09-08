#!/bin/bash

if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi

if [ ! -z "$ACCOUNT" ]; then
  ACCOUNT="--account=$ACCOUNT"
fi

RESULTATS=/$SCRATCH/resultats
mkdir -p $RESULTATS

for cpus in 1 2 4 8; do
  sbatch $ACCOUNT --cpus-per-task=$cpus --output=$RESULTATS/resultat-$cpus.log \
    scripts/nbody-omp.sh
done
