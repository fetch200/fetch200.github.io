#!/usr/bin/env bash
set -e
yarn build
cd public
git add .
git commit -m 'deploy'
git push