#!/bin/sh

echo "-- Setting up node"
nvm install
nvm use --delete-prefix --silent
if ! [ -x "$(command -v webpack)" ]; then
    npm install webpack -g
fi

# install local node packages with yarn
yarn

# not sure this is needed, but appears yarn doesn't properly install node-sass
echo "-- Rebuild node-sass"
npm rebuild node-sass --silent

echo "-- node Setup Done"