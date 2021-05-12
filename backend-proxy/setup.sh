#!/bin/sh


source ../config.sh

rm -rf backend-proxy
git clone --depth 1 https://github.com/tabilab-dip/backend-proxy.git


find ./backend-proxy -type f|xargs perl -pi -e 's/mongodb:\/\/localhost:27017/mongodb:\/\/$ENV{MONGODB_DOCKER_TAG}:27017/g' 
find ./backend-proxy -type f|xargs perl -pi -e 's/FLASK_SECRET_KEY/$ENV{FLASK_SECRET_KEY}/g' 
find ./backend-proxy -type f|xargs perl -pi -e 's/http:\/\/lvh\.me:3000/$ENV{FEND_URL}/g' 
find ./backend-proxy -type f|xargs perl -pi -e 's/http:\/\/lvh\.me:5000/$ENV{BEND_URL}/g' 
