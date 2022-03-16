#!/usr/bin/env python

import numpy as np
import sys


def inv_mat(n):
    '''Inverse une matrice carrée aléatoire de taille n'''
    np.random.seed(0)              # O(1)
    matrice = np.random.rand(n, n) # O(n^2)
    return np.linalg.inv(matrice)  # O(n^3) ?


def main():
    assert len(sys.argv) > 1, f'syntaxe: python {sys.argv[0]} n  # où n > 0'

    n = int(sys.argv[1])
    assert n > 0, f'n doit être plus grand que 0'

    inv_mat(n)


if __name__ == "__main__":
    main()
