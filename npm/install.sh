

packages="$(find . -name 'packages.txt')"
xargs npm install -g < $packages
