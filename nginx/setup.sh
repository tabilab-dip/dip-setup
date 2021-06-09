#!/bin/sh

source ../config.sh
find ./user_conf.d/server.conf -type f|xargs perl -pi -e 's/BASE_URL/$ENV{BASE_URL}/g' 
