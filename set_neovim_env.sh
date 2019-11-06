#! /bin/sh

rm ~/.vimrc
ln ~/.vim/.vimrc ~/.vimrc
ln ~/.vim/.vimrc ~/.vim/init.vim
rm -rf ~/.config/nvim
ln -s ~/.vim ~/.config/nvim

pip2 install neovim --upgrade
pip3 install neovim --upgrade

git config --global core.editor `which nvim`

