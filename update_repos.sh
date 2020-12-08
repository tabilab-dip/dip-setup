#!/bin/bash

REPO_NAMES=(
  "morphological_parser_sak"
  "sentiment_embeddings"
)

REPO_URLS=(
  "https://github.com/tabilab-dip/morphological_parser_sak.git"
  "https://github.com/tabilab-dip/sentiment-embeddings.git"
)


for i in "${!REPO_NAMES[@]}"; 
do
    name=${REPO_NAMES[$i]}
    url=${REPO_URLS[$i]}
    src_dir="./$name/src"
    if ! [ -d  $src_dir ]; then
      echo "$name repo does not exist: cloning..."
      git clone $url $src_dir
    else
        pushd .
        cd src_dir
        echo "Pulling from $url..."
        git pull
        popd
    fi
done



