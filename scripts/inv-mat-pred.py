#!/usr/bin/env python

import argparse as ap
import numpy as np
import pandas as pd


def main():
    # Obtenir le nom du fichier CSV
    parseur = ap.ArgumentParser(description='Analyse des résultats inv-mat.py')
    parseur.add_argument(
        'nom_fichier', metavar='fichier.csv',
        help='Un nom de fichier de résultats')
    arguments = parseur.parse_args()

    # Charger le fichier CSV
    print(f'Chargement du fichier "{arguments.nom_fichier}" ...')
    resultats = pd.read_csv(arguments.nom_fichier)
    print(resultats)
    input('--- Appuyez sur Entrée pour continuer ---')

    # Ajouter des colonnes pour calculer n^2 et n^3
    print(f'Calcul de n^2 et n^3 pour une régression linéaire ...')
    resultats['n2'] = resultats['n'] ** 2
    resultats['n3'] = resultats['n'] ** 3
    print(resultats)
    input('--- Appuyez sur Entrée pour continuer ---')

    # Régression linéaire sur n^2 et n^3
    print(f'Calcul de régression linéaire sur n^2 et n^3 ...')
    coeff = np.linalg.lstsq(
        resultats[['n2', 'n3']].to_numpy(),
        resultats['temps'].to_numpy(), rcond=None)[0]
    print(coeff)
    input('--- Appuyez sur Entrée pour continuer ---')

    # Vérifier les coefficients avec n
    print(f'Tester les coefficients de n^2 et n^3 ...')
    resultats['pred_temps'] = \
        coeff[0] * resultats['n2'] + \
        coeff[1] * resultats['n3']
    resultats['pourc_erreur'] = \
        100.0 * (resultats['pred_temps'] - resultats['temps']).abs() \
        / resultats['temps']
    print(resultats)
    input('--- Appuyez sur Entrée pour continuer ---')

    # Faire une prédiction avec une grande taille n
    n = 10000
    n2 = n ** 2
    n3 = n ** 3
    pred_temps = coeff[0] * n2 + coeff[1] * n3
    print(f'temps(n={n}) = {pred_temps:.2f} secondes')


if __name__ == "__main__":
    main()
