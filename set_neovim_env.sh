#! /bin/sh

set -x

rm -f ~/.vimrc
ln ~/.vim/.vimrc ~/.vimrc
rm -f ~/.vim/init.vim
ln ~/.vim/.vimrc ~/.vim/init.vim
rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim

# pip2 install neovim --upgrade
# pip3 install neovim --upgrade

git config --global core.editor `which nvim`

