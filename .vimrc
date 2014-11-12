scriptencoding utf-8
"viとの互換性を取らない"
set nocompatible

if has('vim_starting')
    filetype plugin off
    filetype indent off
    "neobundle.vimの関数を呼ぶためにインストールしたディレクトリを指定"
    execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
"プラグインインストールディレクトリを指定"
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neoBundle.vim'
call neobundle#end()

"Neobundle自体を管理"
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

"その他管理するプラグイン"
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/kien/ctrlp.vim.git'

set title
set number
set ruler
set nolist
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set showmode

"検索"
set ignorecase
set smartcase
set incsearch
set hlsearch

"編集"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM

set nobackup
set noswapfile

"ファイル形式検出、プラグイン、インデントをON"
syntax on
filetype plugin indent on

"NeoBundle nertdtree Setting"
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

"NeoBundle ctrlp Settings"
let g:ctrlp_map = '<Nop>'
let g:ctrlp_open_new_file = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

"Gtag Settings"
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
