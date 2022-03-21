#!/bin/bash

RESULTATS=$SCRATCH/donnees/res_prll
MON_PROJET=$(ls -d $HOME/projects/def-*/$USER)
FINAL_TSV=$MON_PROJET/resultats.tsv

cd $RESULTATS

echo -e 'inconnu\tespece\tpourcentage' > $FINAL_TSV

for fichier in $(ls); do
  inconnu=$(echo $fichier | cut -d_ -f2)
  espece=$(echo $fichier | cut -d_ -f3)
  echo -en "$inconnu\t$espece\t"

  grep Identities $fichier | awk '{print $3}' | tr '/' ' ' | awk '
    BEGIN {m=0; b=0;}
    {m+=$1; b+=$2;}
    END {b++; pourcent=100.0*m/b; print pourcent"%"}'
done >> $FINAL_TSV

echo $FINAL_TSV
cat $FINAL_TSV
