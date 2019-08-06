#!/bin/bash
#
# An easy way to install all config files that matter on a new server! Easy peasy :)

# Get some packages first!
sudo apt install git vim fish

# Install thefuck for easy command corrections
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
brew install thefuck

# Just get config files
cd ~/
mv .vimrc .vimrcold
wget https://raw.githubusercontent.com/Multipixelone/dotfiles/master/vim/.vimrc -O .vimrc
mkdir -p ~/.config/fish
mkdir -p ~/.config/omf
cd ~/.config/fish
wget https://github.com/Multipixelone/dotfiles/blob/master/fish/.config/fish/config.fish
cd ~/.config/omf
wget https://raw.githubusercontent.com/Multipixelone/dotfiles/master/fish/.config/omf/theme
fish
