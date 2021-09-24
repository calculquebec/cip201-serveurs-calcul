#!/bin/bash

cd $(dirname $(realpath $0))

for taille_bloc in 48 32 24; do
  for taille_prisme in 16 12 8 6; do
    echo ./b5D.omp -a vect -b -n 96 \
      -b1 $taille_bloc -b2 $taille_bloc -b3 $taille_bloc \
      -p1 $taille_prisme -p2 $taille_prisme -p3 $taille_prisme \
      '|' grep Result
  done
done > $SCRATCH/cas-b5D.txt
