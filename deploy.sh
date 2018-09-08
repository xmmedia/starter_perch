#!/bin/sh

echo "Consider using Gitlab CI"

echo "-- Deploy Setup"
# this will setup nvm so the rest will work
. ~/.nvm/nvm.sh

# setup node
. ./node_setup.sh || exit 1

# build
echo "-- Run webpack"
npm run build || exit 1
