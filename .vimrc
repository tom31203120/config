set nocompatible               " be iMproved
filetype off                   " vundle required!

" install vundle first
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" plugins
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'matchit.zip'
" indent
Bundle 'indentpython.vim'
Bundle 'JavaScript-Indent'
Bundle 'indenthtml.vim'
Bundle 'nginx.vim'
" syntax
Bundle 'python.vim'
Bundle 'django.vim'
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
" coloscheme
Bundle 'wombat256.vim'
Bundle 'molokai'
Bundle 'desertedocean.vim'
" snipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
" git
Bundle 'fugitive.vim'
" python-mode
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-powerline'


"" 修改vimrc无需重启
autocmd! bufwritepost .vimrc source %

set go=

"设置冒号命令和搜索命令的历史记录长度
set history=200

" set current dir
set bsdir=buffer

"配色
color desertedocean
set background=dark

"回显输入的命令
set showcmd

"显示当前的模式
set showmode

"不显示工具栏
set guioptions-=T

"在插入和选块模式下启用鼠标
set mouse=iv

"解除Backspace的限制
set backspace=start,indent,eol

"使关联系统的剪贴板
set clipboard+=unnamed

"总是显示当前光标位置
set ruler

"显示行号
set number

"行高亮
set cursorline

"开启文件检测
filetype plugin indent on

"语法高亮
syntax on

" treat \t as how many spaces
set tabstop=4

"按一次tab前进4个字符
set softtabstop=4

"用空格替代tab
set expandtab

set smarttab

"缩进的字符个数
set shiftwidth=4

"智能缩进
set smartindent

"vim内部使用的编码方式
set encoding=utf-8

"vim中当前文件的字符编码方式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" status bar, use powerline
set laststatus=2

"关闭备份,不产生swp文件
set nobackup
set nowb

set guifont=DejaVu\ Sans\ Mono:h11

" 增量搜索
set incsearch

"高亮搜索
set hlsearch

"循环搜索
set wrapscan

"搜索时忽略大小写
set ignorecase

"输入括号时短暂跳到与之相匹配之处
set showmatch

"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>

"让退格、空格、上下箭头遇到行首行尾时自动移到下一行
set whichwrap =b,s,<,>,[,]

"折叠设置
set foldmethod=indent
set foldlevel=3
set foldcolumn=4

"保存文件格式的顺序...放在后面比较有效果
set fileformats=unix

" 打开文件，返回上次光标位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set wildmenu

" 设置非粘贴模式
set nopaste

" 高亮限制行长度
set colorcolumn=80

" undo even file closed
set undofile
set undodir=~/.vim/undodir
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" map keys
let mapleader = ","

" tagbar
nmap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0

" nerdtree
nmap <silent> <F6> :NERDTreeToggle<CR>

" syntastic
" disable python, use python-mode below instead
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['python'] }

" highlight nginx
autocmd BufRead,BufNewFile /etc/nginx/* set filetype=nginx

" python-mode
map <C-l> :call RopeCodeAssist()
let g:pymode_lint_onfly = 1
let g:pymode_lint_cwindow = 0
let g:pymode_lint_cheker = "pylint,pep8,mccabe"
let g:pymode_rope_guess_project = 0
if exists("PyLint")
    autocmd BufWinEnter *.py PyLint
endif
autocmd filetype python inoremap <silent> <C-K> <C-R>=RopeCodeAssistInsertMode()<CR>

" powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'

try
	source $HOME/.vimrc_custom
catch /.*/
endtry
