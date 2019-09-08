#! /bin/sh

rm ~/.vimrc
ln ~/.vim/.vimrc ~/.vimrc
rm -rf ~/.config/nvim
ln -s ~/.vim ~/.config/nvim

