#!/usr/bin/env python

import argparse
import timeit


def crunch(lib, N):
    '''Calcul matriciel "lourd"
    Arguments :
        lib - numpy ou cupy
        N - taille de la matrice cubique à créer
    '''
    matrice = lib.ones((N, N, N))
    matrice /= (N + 1.0)
    matrice.cumsum()
    matrice @ matrice  # O(N^3)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-n', '--taille', type=int, default=512, help='Taille matrice 3D')
    parser.add_argument('--cpu', action='store_true', help='Calcul sur CPU')
    parser.add_argument('--gpu', action='store_true', help='Calcul sur GPU')

    args = parser.parse_args()
    n = args.taille

    if args.cpu:
        import numpy as np
        repet = 4
        temps_sec = timeit.Timer(lambda: crunch(np, n)).timeit(repet)
        print(f'numpy : {temps_sec / repet:.3f} sec.')

    if args.gpu:
        import cupy as cp
        repet = 64
        temps_sec = timeit.Timer(lambda: crunch(cp, n)).timeit(repet)
        print(f'cupy : {temps_sec / repet:.3f} sec.')
