#!/bin/bash

echo Metrique,Valeur

cat - | awk -F, '
  BEGIN {
    n_proc = 1;
    acceleration=1;
    e=0.8;
  }

  /acc_lineaire/ {n_proc = $2;}
  /acceleration/ {acceleration = $2;}

  END {
    fraction_p = (1 - 1 / acceleration) / (1 - 1 / n_proc);
    n_max = (1 / e - fraction_p) / (1 - fraction_p)
    print "P,"fraction_p;
    print "n_max,"n_max;
    print "n_max_entier,"int(n_max);
  }'
