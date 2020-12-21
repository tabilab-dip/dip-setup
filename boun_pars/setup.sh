#!/bin/sh

# src folder supposed to contain: 
#  https://github.com/tabilab-dip/Turku-neural-parser-pipeline-BPARS

pushd .
cd src
git submodule update --init --recursive
if ! [ -d "model_tr_imst_ruled_morphed_pipeline" ]; then
    echo "Trained model is missing. Downloading now:"
    wget http://tabilab.cmpe.boun.edu.tr/BOUN-PARS/model_tr_imst_ruled_morphed_pipeline.tgz
    tar -xvf model_tr_imst_ruled_morphed_pipeline.tgz
    rm model_tr_imst_ruled_morphed_pipeline.tgz
fi
git clone --depth=1 --branch=master https://github.com/tabilab-dip/BOUN-PARS.git bpars
rm -rf ./bpars/.git
mv bpars/* .
rm -rf ./bpars
popd
echo "Repository has been set up. Now you can generate the container"
