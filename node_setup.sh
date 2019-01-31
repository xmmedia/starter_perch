#!/bin/sh

echo "-- Setting up node"

nvm install
nvm use --delete-prefix --silent

# install local node packages with yarn
yarn

# as this is run on the server, we don't want to keep Cypress
echo "-- Remove Cypress"
rm -rf ~/.cache/Cypress

echo "-- node Setup Done"
