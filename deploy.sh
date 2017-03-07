#!/bin/sh

echo "-- Deploy Setup"
# this will setup nvm so the rest will work
. ~/.nvm/nvm.sh

# build commands
. ./node_setup.sh || exit 1
echo "-- npm install"
npm install || exit 1
echo "-- Run webpack"
npm run build || exit 1
