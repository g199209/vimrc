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
