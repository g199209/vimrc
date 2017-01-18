"=======================================================================
" Author:	高明飞
" Email:	G199209@gmail.com
" Blog:		http://GaoMF.cn
" Sections:
"       -> Initial Plugin		加载插件
"       -> General Options		基础设置
"       -> Display Settings		显示界面设置
"       -> Format Settings		排版格式等设置
"       -> Key Remap Settings	自定义快捷键映射
"       -> FileType Settings	针对文件类型的设置
"       -> Pluging Settings		各种插件设置
"=======================================================================

set nocompatible	" 不使用Vi兼容模式

"-------[ Initial Plugin ]----------------------------------------"{{{1

" Use Vundle to manage plugins
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" 插件列表

" Solarized Theme
Plugin 'g199209/vim-colors-solarized'
" Molokai Theme
Plugin 'tomasr/molokai'
" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 开启Man扩展插件
source $VIMRUNTIME/ftplugin/man.vim

" }}}

"-------[ General Options ]----------------------------------------"{{{1

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码： 
set fileencodings=ucs-bom,utf-8,gbk,gb18030,utf-16,big5,cp936,gb2312,iso-8859-1

" keep 100 lines of command line history
set history=100

" 使用了vim-airline后就不需要ruler了
" set ruler			" show the cursor position all the time

" display incomplete commands
set showcmd

" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 允许使用鼠标
set mouse=a

" 开启语法
syntax on

" 滚屏触发行
set scrolloff=7

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Use menu to show command-line completion (in 'full' case)
set wildmenu
" " Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git,*.swp,*.bak,*.class,.svn,*~

" 限制每行宽度
" autocmd FileType text setlocal textwidth=78

" 打开文件时跳至上次关闭的位置
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Backup
" set backup
" set backupext=.bak

" }}}

"-------[ Display Settings ]----------------------------------------"{{{1

" 搜索高亮
set hlsearch

" 高亮当前行、列
set cursorline
" set cursorcolumn

" 是否自动换行
set nowrap
" set wrap

" 是否显示制表符及空白字符
" set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" 显示行号
" set number

" 256 Color Mode
set t_Co=256

" Background color
" set background=light
set background=dark

" }}}

"-------[ Format Settings ]----------------------------------------"{{{1

" TAB键缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4
" smarttab允许缩进不止一个Tab
set smarttab

" 使用空白代替Tab
" set expandtab

" 开启虚空白
set virtualedit=all

" Insert模式下可用删除键删除所有内容
set backspace=indent,eol,start

" Smart indent
set smartindent
" Go with smartindent if there is no plugin indent file.
set autoindent

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=syntax
" 打开文件时的默认折叠级别
" 0 ： 全部折叠
" 99： 可以视为都不折叠
set foldlevel=99

" }}}

"-------[ Key Remap Settings ]----------------------------------------"{{{1

" Leader remap
let mapleader=";"
let g:mapleader = ';'

" Don't use Ex mode, use Q for formatting
map Q gq

" y$ -> Y Make Y behave like other capitals
map Y y$

" 使用H、L快速移动至行首行尾
noremap H ^
noremap L $

" 让p可以在Visual模式下以此前yank的内容替换当前选择的文本块.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" clear out the search highlight result
nnoremap <leader><space> :noh<cr>

" make the tab key match bracket pairs.
" I use this to move around all the time and <tab> is a hell of a lot easier to type than %.
nnoremap <tab> %
vnoremap <tab> %

" save changes
map <Leader>s :wall<CR>
" exit vim without saving any changes
map <Leader>q :qall!<CR>
" exit vim saving changes
map <Leader>w :xall<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r> 

" Toggle line numbers
nmap <silent> <F4> :set number!<CR>

" 分屏窗口移动, use <ctrl> plus direction key to move around within windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"fold mappings, space to toggle fold
nnoremap <space><space> za
vnoremap <space><space> za

"reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" }}}

"-------[ FileType Settings ]----------------------------------------"{{{1

"-----------[ vim ]------------{{{2
autocmd FileType vim set foldmethod=marker
autocmd FileType vim set foldlevel=0
" }}}

" }}}

"-------[ Pluging Settings ]----------------------------------------"{{{1

"-----------[ Solarized Theme ]------------{{{2
" 256色显示模式
let g:solarized_termcolors=256
" Tab等的显示效果等级
let g:solarized_visibility="low"
" 背景色不透明
let g:solarized_termtrans=0
colorscheme solarized
" }}}

"-----------[ Molokai Theme ]------------{{{2
" 256色显示模式
let g:rehash256 = 1
" colorscheme molokai
" }}}

"-----------[ vim-airline (Statue Bar) ]------------{{{2
" 始终显示状态栏
set laststatus=2
" Use powerline font
let g:airline_powerline_fonts = 1
let g:airline_theme="bubblegum"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" }}}
