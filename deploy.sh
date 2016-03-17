#!/bin/sh

echo "-- Deploy Setup"
# this will setup nvm so the rest will work
. ~/.nvm/nvm.sh
. ./node_setup.sh

# install and run gulp
echo "-- npm install"
npm install || exit 1
echo "-- Run Gulp"
gulp || exit 1