#!/bin/sh

echo "-- Setting up node"
nvm install
nvm use --delete-prefix --silent
if ! [ -x "$(command -v webpack)" ]; then
    npm install webpack -g
fi

echo "-- node Setup Done"