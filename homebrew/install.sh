#!bin/bash

# Run the following command to find top-level packages for brew: 'brew leaves'
# And to insert the list directly into 'brew.txt': 'brew leaves > brew.txt'

brewpath="$(find . -name 'brew.txt')"
xargs brew install < $brewpath

# Run the following command to find installed casks: 'brew list --cask'
# Run the following command to find installed casks and insert list into 'casks.txt': 'brew list --cask > casks.txt'

caskpath="$(find . -name 'casks.txt')"
xargs brew install --cask < $caskpath

