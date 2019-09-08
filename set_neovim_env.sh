#! /bin/sh

rm ~/.vimrc
ln ~/.vim/.vimrc ~/.vimrc
rm -rf ~/.config/nvim
ln -s ~/.vim ~/.config/nvim

pip2 install neovim --upgrade
pip3 install neovim --upgrade

git config --global core.editor `which nvim`

