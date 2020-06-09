#!/usr/bin/env bash
set -e
rm -rf build
yarn build
cd public
git init
git add .
git commit -m 'deploy'
git push -f git@github.com:mcx2020/mcx2020.github.io master