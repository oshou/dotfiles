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


"基本設定"
"表示"
set title           "編集ファイル名を表示"
set number          "行番号表示"
set ruler           "ルーラー表示"
set nolist          "タブ、行末の不可視文字を非表示"
set infercase       "補完の時大文字小文字を区別しない"
set showmatch       "閉じ括弧の入力時対応する括弧を表示"
set cursorline      "カーソル行をハイライト"
augroup cch        
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

set ttyfast
set wrap            "ウィンドウ幅より長い行は折り返し"
set laststatus=2    "最下ウィンドウにステータスを常に表示"
set cmdheight=2     "コマンドライン用の画面行数"
set showcmd         "コマンドを画面最下部に表示する"
set showmode
set scrolloff=5     "スクロール時に下余白確保"
set backspace=indent,eol,start  "バックスペースで各種消せるようにする"
set clipboard+=unnamed



"インデント"
set autoindent      "自動インデント"
"set paste          "ペースト時にautoindentを無効にする
set smartindent     "新しい行の開始位置を現在行と同じ場所にする
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set smarttab
set wildmenu
set formatoptions+=mM

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

"エンコード"
set encoding =UTF-8     "エンコード"
set fileencoding=utf-8  "ファイルエンコード"

"ファイル操作"
set hidden
set autoread

"検索"
set incsearch       "インクリメンタルサーチ"
set hlsearch        "検索結果をハイライト表示"
set ignorecase      "検索時に小文字大文字区別無し"
set smartcase       "但し大文字小文字混在の検索の場合は区別して検索"
set wrapscan        "ファイル末尾まで進んだらファイル先頭に戻る"

"バックアップ"
set nobackup
set noswapfile

"ファイル形式検出、プラグイン、インデントをON"
syntax on
filetype plugin indent on

"NeoBundle Setting/Nertdtree"
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

"NeoBundle Setting/Vimshell"
let g:vimshell_interactive_update_time = 10
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>  
