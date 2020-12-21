#!/bin/bash

REPO_NAMES=(
  "morphological_parser_sak"
  "sentiment_embeddings"
  "boun_pars"
)

REPO_URLS=(
  "https://github.com/tabilab-dip/morphological_parser_sak.git"
  "https://github.com/tabilab-dip/sentiment-embeddings.git"
  "https://github.com/tabilab-dip/Turku-neural-parser-pipeline-BPARS.git"
)


for i in "${!REPO_NAMES[@]}"; 
do
    name=${REPO_NAMES[$i]}
    url=${REPO_URLS[$i]}
    src_dir="./$name/src"
    if ! [ -d  $src_dir ]; then
      echo "$name repo does not exist: cloning..."
      git clone --depth 1 $url $src_dir
    else
        pushd .
        cd src_dir
        echo "Pulling from $url..."
        git pull --unshallow
        popd
    fi

    if [ -f  "./$name/setup.sh" ]; then
        echo "Running the setup script for $name"
        pushd .
        cd "./$name"
        bash "./setup.sh"
        popd
    fi

done



