#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
# Code originally from - https://github.com/ofek/ofek.github.io/blob/site/scripts/publish-site.sh
set -euxo pipefail
IFS=$'\n\t'

echo "Publishing site..."

rev=$(git rev-parse --short HEAD)

cd $SITE_DIR

git init
git config user.name "Nicholas Muesch"
git config user.email "mueschn@gmail.com"

git remote add upstream "https://$GITHUB_TOKEN@github.com/nmuesch/nmuesch.github.io.git"
git fetch upstream
git reset upstream/master

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:master

echo "Published to master branch."