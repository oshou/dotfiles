"Compatiblity
"-----------------------------------------------------------------------
set nocompatible        "vi互換動作の無効化
filetype off            "最初にファイルタイプ関連を無効化


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


"Basic
"-----------------------------------------------------------------------
set number              "行番号表示"
set nolist              "タブ、行末の不可視文字(空白等)を非表示"
set cursorline          "カーソル行をハイライト"
set scrolloff=5         "スクロール時の余白確保"
set infercase           "補完の時大文字小文字を区別しない"
set browsedir=buffer    "Explorerの初期ディレクトリ"
set showmatch           "閉じ括弧の入力時対応する括弧を表示"
set matchtime=1
augroup cch
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
set ttyfast             "ターミナル接続を高速化"
set nowrap              "ウィンドウ幅より長い行は折り返し"
set backspace=indent,eol,start  "バックスペースで各種消せるようにする"
set clipboard+=unnamed,autoselect   "OSクリップボードを使用"


"Status bar
"-----------------------------------------------------------------------
set laststatus=2        "ウィンドウ下部にステータスバーを常に表示"
set title               "ステータスバーに編集中のファイル名を表示"
set ruler               "ステータスバーにカーソルの行数、列数を表示"
set showcmd             "ステータスバーに入力中のコマンドを表示"
set cmdheight=2         "ステータスバーのコマンドライン用の画面行数"
set showmode            "ステータスバーに現在のモードを表示
set linespace=0


"Indent
"-----------------------------------------------------------------------
set autoindent          "自動インデントを有効化"
set paste               "ペースト時にautoindentを無効にする
set smartindent         "改行時にインデントを前行と同じにする
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab           "Tabを半角スペースで挿入"
set smarttab
set display=lastline
set formatoptions+=mM

if has("autocmd")
  filetype plugin on    "ファイルタイプに合わせたプラグインを有効化
  filetype indent on    "ファイルタイプに合わせたインデントを有効化

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
set encoding =UTF-8     "デフォルトのエンコーディング"
set fileencoding=utf-8  "デフォルトのファイルエンコーディング"


"Syntax color
"-----------------------------------------------------------------------
syntax on
highlight LineNr ctermfg=darkgrey


"Backup
"-----------------------------------------------------------------------
set nobackup            "バックアップを作成しない
set noswapfile          "swapファイルを作成しない
set noundofile          "undoファイル(*.un~)を作成しない


"Operation
"-----------------------------------------------------------------------
set mouse=a             "ターミナルでマウスを使用可能にする"
set hidden              "複数ファイルの編集を可能にする"
set autoread            "内容が編集されたら自動再読込"
set pastetoggle=


"Search
"-----------------------------------------------------------------------
set incsearch           "インクリメンタルサーチ"
set hlsearch            "検索時に結果をハイライト表示"
set ignorecase          "検索時に大文字小文字を区別しない"
set wrapscan            "検索時にファイル末尾まで進んだらファイル先頭に戻る"
nmap <silent> <Esc><Esc> :nohlsearch<CR>    "Escキー2回押しでハイライト消去"


"Window
"-----------------------------------------------------------------------
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h
nnoremap L <c-w>l
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


"Autocomplete
"-----------------------------------------------------------------------
set wildmenu            "コマンド補完を強化
set wildchar=<tab>      "コマンド補完を開始するキー
set wildmode=list:full  "コマンド補完時のモード(リスト表示、最長マッチ)
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
