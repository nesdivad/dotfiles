#!bin/bash

brewpath="$(find . -name 'brew.txt')"
xargs brew install < $brewpath

caskpath="$(find . -name 'casks.txt')"
xargs brew install --cask < $caskpath

