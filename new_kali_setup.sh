#!/bin/bash

sudo apt install neovim
sudo apt install xournalpp
sudo apt install keepass2 
sudo apt install telegram-desktop
sudo apt install cmake
# Neovim won't build without it
sudo apt install gettext
# sudo apt install texlive-full 

# Build neovim
git clone https://github.com/neovim/neovim
cd neovim/
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cp nvim ~/.config/ -r

git config --global user.email "kolya.kasparov@gmail.com"
git config --global user.name "nniikon"
