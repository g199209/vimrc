echo "Install dependencies? (y/n)?"
read DEP
if [ $DEP == "y" ]; then
sudo apt update
sudo apt install build-essential libncurses5-dev
sudo apt install python python3 python-dev python3-dev
sudo apt install ruby ruby-dev
sudo apt install lua5.2 liblua5.2-dev luajit libluajit-5.1-dev
sudo apt install perl libperl-dev
sudo apt install tcl8.5 tcl8.5-dev libtcl8.5
sudo apt install exuberant-ctags cscope
sudo apt install libgnomeui-dev libx11-dev libxt-dev libxpm-dev libgtk2.0-dev libgnome2-dev 
fi

make clean
make distclean

./configure \
    --with-compiledby="Mingfei Gao" \
    --with-features=huge \
    --enable-multibyte \
    --enable-cscope=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --enable-perlinterp=yes \
    --enable-rubyinterp=yes \
    --enable-luainterp=yes \
    --with-luajit \
    --enable-tclinterp=yes \
    --enable-gui=gnome2 \
	--enable-gtk2-check \
	--enable-gnome-check \
	--with-x \
    --enable-fail-if-missing 

make -j 8 && sudo make install
vim --version
