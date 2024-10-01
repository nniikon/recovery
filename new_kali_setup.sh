#!/bin/bash

sudo apt update
sudo apt upgrade
# sudo apt install xournalpp
sudo apt install keepass2 
sudo apt install nodejs
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
cd ../

# Build lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

cp nvim ~/.config/ -r

# Build tmux
git clone https://github.com/tmux/tmux.git
cd tmux/
sudo apt install autoconf
sudo apt install automake
sudo apt install pkg-config
sudo apt install libevent-dev
sudo apt install bison
sudo apt install byacc
sh autogen.sh
./configure && make
cd ../

git config --global user.email "kolya.kasparov@gmail.com"
git config --global user.name "nniikon"

ssh-keygen -t ed25519 -C "kolya.kasparov@gmail.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
