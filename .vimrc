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
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Bookmarks
Plugin 'MattesGroeger/vim-bookmarks'
" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
" EasyGrep
Plugin 'dkprice/vim-easygrep'
" AutoPair
Plugin 'jiangmiao/auto-pairs'
" TagList
Plugin 'taglist.vim'
" Startify
Plugin 'mhinz/vim-startify'
" NerdCommenter 
Plugin 'scrooloose/nerdcommenter'
" Ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Fcitx.Vim
Plugin 'lilydjwg/fcitx.vim'
" EasyMotion
Plugin 'easymotion/vim-easymotion'
" Conque-GDB
Plugin 'Conque-GDB'
" Markdown
Plugin 'gabrielelana/vim-markdown'
" Markdown-quote-syntax
Plugin 'joker1007/vim-markdown-quote-syntax'
" Autosave
Plugin 'vim-auto-save'

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

" 允许在没有保存的情况下切换Buffer
set hidden

" Swap
set noswapfile

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
set virtualedit=onemore

" Insert模式下可用删除键删除所有内容
set backspace=indent,eol,start

" Smart indent
set smartindent
" Go with smartindent if there is no plugin indent file.
set autoindent

" 自动缩进开关
set pastetoggle=<F9>

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

" 使用H、L快速移动至行首行尾
noremap H ^
noremap L $

" 快速移至屏幕上方和下方
nnoremap <leader>j L
nnoremap <leader>k H

" clear out the search highlight result
nnoremap <leader><space> :noh<CR>

" Use Ctrl-A to select all
nnoremap <C-a> ggVG 

" 快速插入当前日期时间
inoremap <C-t> <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" make the tab key match bracket pairs.
" I use this to move around all the time and <tab> is a hell of a lot easier to type than %.
nnoremap <tab> %
vnoremap <tab> %

" 跳转
nnoremap <space>o <C-o>
nnoremap <space>i <C-i>

" save changes
nnoremap <leader>w :wall<CR>
" exit vim
nnoremap <leader>q :qall<CR>
" close this window
nnoremap <leader>x :close<CR>
" only show this window
nnoremap <leader>o :only<CR>

" Toggle line numbers
nmap <silent> <F4> :set number!<CR>

" 分屏窗口移动, use <ctrl> plus direction key to move around within windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer Movements
nnoremap <leader>bn :bn<CR>
nnoremap <silent> <Right> :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <silent> <Left> :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bb :buffer 

"fold mappings, space to toggle fold
nnoremap <space><space> za
vnoremap <space><space> za

" 在Visual模式下可以用*来搜索选择的内容
vnoremap * y/<C-r>"<CR>

" 让p可以在Visual模式下以此前yank的内容替换当前选择的文本块.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" y$ -> Y Make Y behave like other capitals
map Y y$

"reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" }}}

"-------[ FileType Settings ]----------------------------------------"{{{1

"-----------[ vim ]------------{{{2

autocmd FileType vim set foldmethod=marker
autocmd FileType vim set foldlevel=0

" }}}

"-----------[ markdown ]------------{{{2

autocmd FileType markdown set wrap
autocmd FileType markdown nnoremap j gj
autocmd FileType markdown nnoremap k gk

" }}}

" }}}

"-------[ Pluging Settings ]----------------------------------------"{{{1

"-----------[ Man ]------------{{{2

" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

" }}}

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

"-----------[ Airline ]------------{{{2
"
" 始终显示状态栏
set laststatus=2

" Use powerline font
let g:airline_powerline_fonts = 1

" Theme
let g:airline_theme="bubblegum"

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" }}}

"-----------[ Bookmarks ]------------{{{2

" 标记颜色
highlight BookmarkSign ctermbg=NONE ctermfg=027 
highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=022

" Enables/disables automatic saving for bookmarks
let g:bookmark_auto_save = 0

" Automatically close bookmarks split when jumping to a bookmark
let g:bookmark_auto_close = 1

" Enables/disables warning when toggling to clear a bookmark with annotation
let g:bookmark_show_toggle_warning = 0

" Enables/disables line centering when jumping to bookmark
let g:bookmark_center = 0

" }}}

"-----------[ NERDTree ]------------{{{2

" 切换NERDTree窗口快捷键
map <F2> :NERDTreeTabsToggle<CR>

let NERDTreeIgnore=['\.py[cd]$', '\~$']

" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI = 1

" 显示隐藏文件
let NERDTreeShowHidden = 1

" When switching into a tab, make sure that focus is on the file window, not in the NERDTree window. 
let g:nerdtree_tabs_focus_on_files = 0

" A single click will open directory nodes, while a double click will still be required for file nodes.
let NERDTreeMouseMode=2

" }}}

"-----------[ YouCompleteMe ]------------{{{2

" 重新定义Vim的gd操作
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_key_invoke_completion = '<C-j>'

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <C-x><C-x> <C-x><C-o>

" 不使用新窗口提示函数原型
" set completeopt=menuone, preview
set completeopt=menuone 

" ycm_extra_conf
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_cpp_conf.py'

" 错误及警告标志
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

" 注释及字符串中补全
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1

" 语法关键词补全
let g:ycm_seed_identifiers_with_syntax = 1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 弹出菜单及选中项颜色
highlight Pmenu ctermbg=12 ctermfg=238
highlight PmenuSel ctermbg=7 ctermfg=70                         

" }}}

"-----------[ CtrlP ]------------{{{2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>bl :CtrlPBuffer<CR> 

" }}}

"-----------[ AutoPair ]------------{{{2

let g:AutoPairsFlyMode = 1      
let g:AutoPairsShortcutBackInsert = '<C-)>'

" }}}

"-----------[ EasyGrep ]------------{{{2

" 默认只搜索关联文件
let g:EasyGrepMode = 2

" 不自动打开搜索结果
let g:EasyGrepJumpToMatch = 0


" }}}

"-----------[ Taglist ]------------{{{2

" 切换Taglist窗口快捷键
map <F3> :TlistToggle<CR>

" 只显示当前文件Tag
let Tlist_Show_One_File = 1

" 显示函数原型
let Tlist_Display_Prototype = 0 

" 按名称排序
let Tlist_Sort_Type = "name"

" Right side
let Tlist_Use_Right_Window = 1

" }}}

"-----------[ NerdCommenter ]------------{{{2

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" C语言也使用//风格的单行注释
let g:NERDCustomDelimiters = { 'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }  }

" }}}

"-----------[ Ultisnips ]------------{{{2

" Snippets location
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnips"]

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<C-x><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-x><tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x><s-tab>"

" }}}

"-----------[ Fcitx.Vim ]------------{{{2

" 减小延迟
set ttimeoutlen=50

" }}}

"-----------[ EasyMotion ]------------{{{2

nmap <leader>s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-sl)

" }}}

"-----------[ Conque-GDB ]------------{{{2

let g:ConqueGdb_Leader = '\'

" let g:ConqueGdb_Run = <F5>
let g:ConqueGdb_Continue = '<F5>'
let g:ConqueGdb_Step = '<F6>'
let g:ConqueGdb_Print = '<F7>'
let g:ConqueGdb_ToggleBreak = '<F8>'
" let g:ConqueGdb_SetBreak = '<NUL>'
" let g:ConqueGdb_DeleteBreak =  '<NUL>'
" let g:ConqueGdb_Finish = '<NUL>'
" let g:ConqueGdb_Backtrace = '<NUL>'

" }}}

"-----------[ Markdown ]------------{{{2

" Disable support for Jekyll files
let g:markdown_include_jekyll_support = 0

" Disable default mappings
let g:markdown_enable_mappings = 0

" Enable conceal for italic, bold, inline-code and link
let g:markdown_enable_conceal = 1

" Disable spell checking, it's wrong for Chinese.
let g:markdown_enable_spell_checking = 0

" }}}

"-----------[ Markdown-quote-syntax ]------------{{{2

" Add syntax rule
let g:markdown_quote_syntax_filetypes = {
        \ "css" : {
        \   "start" : "\\%(css\\|scss\\)",
        \},
        \ "c" : {
        \   "start" : "c",
        \},
  \}

" }}}

"-----------[ Autosave ]------------{{{2

" enable AutoSave on Vim startup"
let g:auto_save = 1 

" do not save while in insert mode
let g:auto_save_in_insert_mode = 0

" do not display the auto-save notification
let g:auto_save_silent = 1

" }}}

" }}}
