#!/bin/bash

sudo apt update
sudo apt install nodejs cmake gettext tmux

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

cp nvim ~/.config/nvim -r
