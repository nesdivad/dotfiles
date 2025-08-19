# Set up Neovim

if ! [ -d ~/.config ]
then
	echo "~/.config/ missing. Creating directory ..."
	mkdir ~/.config
fi

if ! [ -d ~/.config/nvim ]
then
	echo "~/.config/nvim/ missing. Creating directory ..."
	mkdir ~/.config/nvim
fi

if [ -f ~/.config/nvim/init.lua ] 
then
	echo "init.lua already exists at path ~/.config/nvim/init.lua ..."
	echo "Please copy `init.lua` into the directory manually."
else
	echo "Linking `ìnit.lua` into ~/.config/nvim/init.lua ..."
	ln ./init.lua ~/.config/nvim/init.lua
fi

if ! [ -d ~/.config/nvim/lua ]
then
	echo "creating lua directory ..."
	mkdir ~/.config/nvim/lua
fi

ln -s lua/*.lua ~/.config/nvim/lua

ln -s lua/plugins/*.lua ~/.config/nvim/lua/plugins
