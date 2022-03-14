#!/bin/bash

RESULTATS=/$SCRATCH/resultats
MON_PROJET=$(ls -d $HOME/projects/def-*/$USER)
FINAL_TSV=$MON_PROJET/nbody.tsv

cat $RESULTATS/*.log | awk '
  BEGIN   { temps_1 = 0;
            printf "n_proc\ttemps\taccel\teffic\n";
          }
  /Temps/ { temps = $3; n_proc = $6;
            if (n_proc == 1) {
              temps_1 = temps;
            }
            accel = temps_1 / temps;
            effic = 100 * accel / n_proc
            printf "%d\t%.2f\t%.2f\t%.2f%%\n",
              n_proc,temps,accel,effic;
          }' > $FINAL_TSV

echo $FINAL_TSV
cat $FINAL_TSV
