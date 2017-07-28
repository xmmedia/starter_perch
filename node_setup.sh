#!/bin/sh

echo "-- Setting up node"

nvm install
nvm use --delete-prefix --silent

# install local node packages with yarn
yarn

echo "-- node Setup Done"