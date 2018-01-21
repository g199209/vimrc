# My Vim configuration

插件管理使用Vundle，Vundle本身作为一个submodule添加，再通过Vundle添加其他插件。

使用`git clone`下载此配置文件后，并不会自动下载Vundle，需要执行以下命令下载Vundle：

```
git submodule update --init --recursive
```

`UpdateYCM.sh`文件用于重建YouCompleteMe的LLVM服务器后端，新安装或更新YCM插件后均需要再次运行此脚本。

需要在用户目录下同时建立`.vimrc`文件：`ln ~/.vim/.vimrc ~/.vimrc`

