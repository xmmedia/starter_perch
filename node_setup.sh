#!/bin/sh

echo "-- Setting up node"
nvm install
nvm use --delete-prefix --silent
if ! [ -x "$(command -v gulp)" ]; then
    npm install gulp -g
fi

echo "-- node Setup Done"