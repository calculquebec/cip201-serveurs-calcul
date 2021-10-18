#!/bin/bash

cd $HOME

VERSION="11.0"
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

module load gcc cuda
export PROJECTS=Samples/matrixMul/Makefile
make
