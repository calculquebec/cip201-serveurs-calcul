#!/bin/bash
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

module load gcc/9.3.0 python/3.8.10 scipy-stack/2022a

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi

FIC_CSV=temps_inv.csv
echo 'temps,n' > $FIC_CSV

valeurs_n=(192 384 768 1536 3072 6144)
n_max=6144

for n in ${valeurs_n[@]}; do
  # Réduire le nombre d'appels selon n
  nb_appels=$((2 * n_max / n))
  echo "Appel de inv_mat(${n}) ${nb_appels} fois ..."

  temps_total=0
  for appel in $(seq 1 $nb_appels); do
    temps_real=$(2>&1 time -p python scripts/inv-mat.py $n | grep real)
    temps_sec=$(echo $temps_real | cut -d' ' -f2)
    temps_total=$(echo $temps_total + $temps_sec | bc -l)
  done

  temps_par_appel=$(echo $temps_total / $nb_appels | bc -l)
  echo "$temps_par_appel,$n" > $FIC_CSV
done

echo Terminé.
