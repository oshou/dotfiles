scriptencoding utf-8    "viとの互換性を取らない"
set nocompatible        "移動コマンドを使った時行頭へ移動しない"

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
NeoBundle 'git://github.com/bbatsov/rubocop.git'
NeoBundle 'git://github.com/Shougo/neosnippet.vim.git'

"基本設定"
set title           "編集ファイル名を表示"
set number          "行番号表示"
set ruler           "ルーラー表示"
set nolist          "タブ、行末の不可視文字を非表示"
set showmatch       "閉じ括弧の入力時対応する括弧を表示"
set infercase       "補完の時大文字小文字を区別しない"
set wrap            "ウィンドウ幅より長い行は折り返し"
set laststatus=2
set cmdheight=2
set showcmd         "コマンドを画面最下部に表示する"
set showmode
set scrolloff=5     "スクロール時に下が見えるようにする"

"エンコード"
set encoding =UTF-8     "エンコード"
set fileencoding=utf-8  "ファイルエンコード"

"インデント"
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start  "バックスペースで各種消せるようにする"
set wildmenu
set formatoptions+=mM

"ファイル操作"
set hidden
set autoread

"検索"
set incsearch       "インクリメンタルサーチ"
set hlsearch        "検索結果をハイライト表示"
set ignorecase      "検索時に小文字大文字区別無し"
set smartcase       "但し大文字小文字混在の検索の場合は区別して検索"
set wrapscan

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
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>  
