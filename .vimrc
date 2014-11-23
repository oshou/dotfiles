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

"その他プラグイン"
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/Shougo/vimproc.vim.git'
NeoBundle 'git://github.com/Shougo/vimshell.vim.git'

"基本設定"
set title           "編集ファイル名を表示"
set number          "行番号表示"
set ruler           "ルーラー表示"
set list            "タブ、行末の不可視文字を表示"
set showmatch       "閉じ括弧の入力時対応する括弧を表示"
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set showmode
set paste

"インデント"
set cindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"ファイル操作"
set encoding =UTF-8
set hidden
set autoread

"検索"
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

"編集"
set autoindent
set backspace=indent,eol,start
set wildmenu
set formatoptions+=mM

"バックアップ"
set nobackup
set noswapfile

"ファイル形式検出、プラグイン、インデントをON"
syntax on
filetype plugin indent on

"NeoBundle Nertdtree Setting"
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

"NeoBundle Vimshell Setting"
let g:vimshell_interactive_update_time = 10
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>
