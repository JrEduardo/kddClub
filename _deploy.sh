#!/bin/sh

git config --global user.email "edujrrib@gmail.com"
git config --global user.name "Travis boot"

git clone -b gh-pages https://${GIT_KEY}@github.com/${TRAVIS_REPO_SLUG}.git site-output
cd site-output
cp -r ../_KDDSITE/* ./
git add --all *
git commit -m "Automatic Update (build number ${TRAVIS_BUILD_NUMBER})" || true
git push origin gh-pages
