#!/bin/sh

echo "-- Deploy Setup"
# this will setup nvm so the rest will work
. ~/.bashrc || exit 1

# build commands
echo "-- Setting up node"
nvm install v4.2.6 || exit 1
if ! [ -x "$(command -v gulp)" ]; then
    npm install gulp -g || exit 1
fi
echo "-- npm install"
npm install || exit 1
echo "-- Run Gulp"
gulp || exit 1