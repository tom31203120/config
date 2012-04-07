set nocompatible

"" 修改vimrc无需重启
autocmd! bufwritepost _vimrc source %

"缓冲区写入文件的时候自动检查文件类型
"au BufWritePost * filet detect

"设置冒号命令和搜索命令的历史记录长度
set history=200

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

"vim内部使用的编码方式
set encoding=utf-8

"vim中当前文件的字符编码方式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"状态栏显示设置
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\
set statusline+=%f\
set statusline+=%h%1*%m%r%w%0*
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'},
    set statusline+=%{&fileencoding},
endif
set statusline+=%{&fileformat}]
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()}
endif
set statusline+=%=
set statusline+=0x%-8B\
set statusline+=%-14.(%l,%c%V%)\ %<%P

"关闭备份,不产生swp文件
set nobackup
set nowb

"设定文件浏览器目录为当前目录
set bsdir=buffer

"配色方案
color desert
set background=dark

"字体设置(含双字节字符字体，黑体)
set guifont=Bitstream\ Vera\ Sans\ Mono:h10
set guifontwide=Microsoft\ Yahei:h9

"开启文件检测
filetype plugin indent on

"语法高亮
syntax on

"智能对齐方式
set smartindent

"tab占4个字符
set tabstop=4

"按一次tab前进4个字符
set softtabstop=4

"用空格替代tab
set expandtab
set smarttab 

"自动缩进
set autoindent

"缩进的字符个数
set cindent shiftwidth=4

"即时搜索及反白显示第一个匹配
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
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set wildmenu

"设置粘贴模式
set paste

" enable undo after file closed
set undofile
set undodir=~/.vim/undodir
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"word separator exclude _
"set iskeyword-=_

"--- plugin
"disable logging
let g:js_indent_log = 0

"tagbar
nmap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0

"jslint
nmap <silent> <F6> :JSLintUpdate<CR>

"pylint
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0
