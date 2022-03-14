#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Syntaxe de commande : $0 n_proc1:temps1 n_proc2:temps2"
  echo "  où n_proc1 < n_proc2"
  echo "  Exemple: $0 1:61.8 4:16.8"
  exit
fi

n_proc1=$(echo $1 | cut -d: -f1)
n_proc2=$(echo $2 | cut -d: -f1)

temps1=$(echo $1 | cut -d: -f2)
temps2=$(echo $2 | cut -d: -f2)

acc_lineaire=$(echo $n_proc2 / $n_proc1 | bc -l)
acceleration=$(echo $temps1 / $temps2 | bc -l)
efficacite=$(echo $acceleration / $acc_lineaire | bc -l)

echo Metrique,Valeur
echo acc_lineaire,${acc_lineaire:0:5}
echo acceleration,${acceleration:0:5}
echo efficacite,${efficacite:0:5}
