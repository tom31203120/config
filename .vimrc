set nocompatible               " be iMproved
filetype off                   " vundle required!

" install vundle first
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'matchit.zip'
" indent
Bundle 'JavaScript-Indent'
Bundle 'Valloric/python-indent'
Bundle 'nginx.vim'
" syntax
Bundle 'saltstack/salt-vim'
Bundle 'python.vim'
Bundle 'jgb/django.vim'
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'plasticboy/vim-markdown'
" snipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
" git
Bundle 'fugitive.vim'
Bundle 'jnwhiteh/vim-golang'
" coloscheme
Bundle 'desertedocean.vim'

"" 修改vimrc无需重启
autocmd! bufwritepost .vimrc source %

set go=

"设置冒号命令和搜索命令的历史记录长度
set history=200

" set current dir
set browsedir=buffer

"配色
set background=dark
if has("gui_running")
    colorscheme koehler
else
    colorscheme desertedocean
endif

"回显输入的命令
set showcmd

"显示当前的模式
set showmode

" no toolbar
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
filetype on
filetype plugin on
filetype indent on

"语法高亮
syntax on

" treat \t as how many spaces
set tabstop=4
"按一次tab前进4个字符
set softtabstop=4
"用空格替代tab
set smarttab
set expandtab
function! AutoExpandtab()
    " check if should expandtab
    let tab_lines_num = 0
    for line in getline(15, 15 + 40)
        if line =~ '^	.*'
            let tab_lines_num += 1
        endif
    endfor
    if tab_lines_num > 2
        setlocal noexpandtab
    endif
endfunction
autocmd BufWinEnter *.py :call AutoExpandtab()

"缩进的字符个数
set shiftwidth=4
"缩进
set cindent
set autoindent

set listchars=tab:>-

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

set guifont=DejaVu\ Sans\ Mono:h12
set linespace=2

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

"试探换行符类型的顺序...
set fileformats=unix,dos

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

" 打开文件，返回上次光标位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" map keys
let mapleader = ","

" highlight
autocmd BufRead,BufNewFile /etc/nginx/* set filetype=nginx
autocmd BufRead,BufNewFile *.conf set filetype=conf

autocmd filetype python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

" tagbar
Bundle 'majutsushi/tagbar'
nmap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0

" nerdtree
Bundle 'scrooloose/nerdtree'
nmap <silent> <F6> :NERDTreeToggle<CR>

" syntastic
Bundle 'scrooloose/syntastic'
" disable python, use python-mode below instead
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['python'] }
let g:syntastic_python_checkers = ['pylint']
"autocmd BufWinEnter *.py SyntasticCheck

" python-mode
Bundle 'Python-mode-klen'
let g:pymode_lint_onfly = 0
let g:pymode_lint_write = 1
let g:pymode_lint_cwindow = 0
let g:pymode_lint_checker = 'pyflakes'
let g:pymode_lint_ignore = 'E501,W0142,F0401,E1103,C0301,W191,E122,E123,E124,E128,E126,E226,E231'
let g:pymode_rope_guess_project = 0
autocmd BufWinEnter *.py PyLint
" disable python-mode RopeCodeAssistInsertMode Key binding
map <C-Space> <nop>
autocmd filetype python nmap <Leader>g :call RopeGotoDefinition()
autocmd filetype python nmap F :PyLintAuto<CR>
autocmd filetype python inoremap <silent> <C-K> <C-R>=RopeCodeAssistInsertMode()<CR>

" powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'

" jedi, disable it for exception when enter insert mode
"Bundle 'davidhalter/jedi-vim'
"let g:jedi#popup_on_dot = 0
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#related_names_command = "<leader>n"
"let g:jedi#autocompletion_command = "<C-k>"

Bundle 'digitaltoad/vim-jade'
autocmd BufRead,BufNewFile *.jade set filetype=jade
Bundle "groenewege/vim-less"
Bundle "wavded/vim-stylus"
Bundle "kchmck/vim-coffee-script"
autocmd BufRead,BufNewFile *.coffee set filetype=coffee
au bufwritepost *.coffee silent execute '!coffee -cm %'

Bundle "nathanaelkane/vim-indent-guides"
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

try
    source $HOME/.vimrc_custom
catch /.*/
endtry
