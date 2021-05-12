#!/bin/sh


source ../config.sh

rm -rf demo-frontend
git clone --depth 1 https://github.com/tabilab-dip/demo-frontend.git

# replace every http://lvh.me:3000 to f-end URL, 5000 with b-end
find ./demo-frontend -type f|xargs perl -pi -e 's/http:\/\/lvh\.me:3000/$ENV{FEND_URL}/g' 
find ./demo-frontend -type f|xargs perl -pi -e 's/http:\/\/lvh\.me:5000/$ENV{BEND_URL}/g' 

