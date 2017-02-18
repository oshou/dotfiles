"Compatible setting
"-----------------------------------------------------------------------
set nocompatible
filetype off


"Plugin
"-----------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'kana/vim-smartchr'
Plugin 'vim-scripts/Super-Shell-Indent'
call vundle#end()

filetype plugin indent on


"Basic
"-----------------------------------------------------------------------
set number          "行番号表示"
set nolist          "タブ、行末の不可視文字を非表示"
set cursorline      "カーソル行をハイライト"
set infercase       "補完の時大文字小文字を区別しない"
set showmatch       "閉じ括弧の入力時対応する括弧を表示"
set matchtime=1
augroup cch
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
set ttyfast         "高速ターミナル接続を行う"
set wrap            "ウィンドウ幅より長い行は折り返し"
set showmode
set scrolloff=5     "スクロール時に下余白確保"
set backspace=indent,eol,start  "バックスペースで各種消せるようにする"
set clipboard+=unnamed,autoselect


"Status bar
"-----------------------------------------------------------------------
set title           "編集ファイル名を表示"
set ruler           "ルーラー表示"
set wildmenu        "補完機能を強化
set showcmd         "入力中のコマンドを画面最下部に表示する"
set linespace=0
set laststatus=2    "最下ウィンドウにステータスを常に表示"
set cmdheight=2     "コマンドライン用の画面行数"


"Indent
"-----------------------------------------------------------------------
set autoindent      "自動インデント"
"set paste          "ペースト時にautoindentを無効にする
set smartindent     "新しい行の開始位置を現在行と同じ場所にする
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set smarttab
set display=lastline
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
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=1 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
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


"Encode
"-----------------------------------------------------------------------
scriptencoding utf-8    "viとの互換性を取らない"
set encoding =UTF-8     "エンコード"
set fileencoding=utf-8  "ファイルエンコード"


"Syntax color
"-----------------------------------------------------------------------
syntax on
highlight LineNr ctermfg=darkgrey
filetype plugin indent on


"Backup
"-----------------------------------------------------------------------
set nobackup
set noswapfile
set confirm


"Operation
"-----------------------------------------------------------------------
set hidden
set autoread
set pastetoggle=
set mouse=a


"Search
"-----------------------------------------------------------------------
set incsearch       "インクリメンタルサーチ"
set hlsearch        "検索結果をハイライト表示"
set ignorecase      "検索時に小文字大文字の区別を無視する"
set smartcase       "但し大文字小文字混在の検索の場合は区別して検索"
set wrapscan        "ファイル末尾まで進んだらファイル先頭に戻る"


"Window
"-----------------------------------------------------------------------
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h
nnoremap L <c-w>l
nnoremap < <c-w>>
nnoremap > <c-w><
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>


"Misc
"-----------------------------------------------------------------------
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap <S-Tab> <<
nmap <silent> <Esc><Esc> :nohlsearch<CR>


"Autocomplete
"-----------------------------------------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap '' ''<Left>
imap "" ""<Left>
imap \|\| \|\|<Left>
inoremap <expr> = smartchr#one_of(' = ','=',' == ','==',' === ')
inoremap <expr> # smartchr#one_of('# ','#')
inoremap <S-Tab> <C-d>
autocmd BufWritePre * :%s/\s\+$//e
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee


"Bundle Setting/Nertdtree"
"-----------------------------------------------------------------------
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
