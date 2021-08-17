#!/usr/bin/env python

import numpy as np
import pandas as pd
import timeit


def inv_mat(n):
    '''Inverse une matrice carrée aléatoire de taille n'''
    np.random.seed(0)              # O(1)
    matrice = np.random.rand(n, n) # O(n^2)
    return np.linalg.inv(matrice)  # O(n^3) ?


def main():
    # Différentes tailles n, augmentation exponentielle
    valeurs_n = [3 * 2**e for e in range(6, 12)]
    les_temps = []  # Pour le cumul des temps de calcul

    # Pour chaque valeur de taille n
    for n in valeurs_n:
        # Réduire le nombre d'appels selon n
        nb_appels = int(2 * max(valeurs_n) / n)
        print(f'Appel de inv_mat({n}) {nb_appels} fois ...')

        # Mesurer nb_appels fois le temps de calcul de inv_mat(n)
        # Sauvegarder le temps d'un seul calcul
        temps = timeit.timeit(lambda: inv_mat(n), number=nb_appels)
        les_temps.append(temps / nb_appels)

    resultats = pd.DataFrame({'temps': les_temps, 'n': valeurs_n})
    resultats.to_csv('temps_inv.csv', index=False)


if __name__ == "__main__":
    main()
