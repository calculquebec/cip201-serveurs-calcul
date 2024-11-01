#!/bin/bash

cd $HOME

VERSION="12.1"
TAR_GZ="v${VERSION}.tar.gz"
DOSSIER="cuda-samples-${VERSION}"

if [ ! -f ${TAR_GZ} ]; then
  wget https://github.com/NVIDIA/cuda-samples/archive/refs/tags/${TAR_GZ}
else
  echo CUDA Samples ${VERSION} déjà téléchargés
fi

if [ ! -d ${DOSSIER} ]; then
  echo "Extraction de l'archive ${TAR_GZ} ..."
  tar -zxf ${TAR_GZ}
else
  echo CUDA Samples ${VERSION} déjà extraits
fi

cd ${DOSSIER}

module load StdEnv/2023 gcc/12.3 cuda/12.2
export PROJECTS=Samples/matrixMul/Makefile
make
