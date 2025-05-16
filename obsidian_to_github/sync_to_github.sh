#!/bin/bash

cd "/Users/wpq/Dropbox (MIT)/obsidian"
git add obsidian/Research/meta/

if git diff --staged --quiet; then
  echo "No changes to commit."
else
  git commit -m "$(date +'%Y-%m-%d') update"
  git push
fi