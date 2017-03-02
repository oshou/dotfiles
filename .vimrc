"Compatibility
"-----------------------------------------------------------------------
"vi互換動作の無効化
set nocompatible
"最初にファイルタイプ関連を無効化
filetype off

"Plugin
"-----------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-smartchr'
Plugin 'vim-scripts/Super-Shell-Indent'
call vundle#end()

filetype plugin indent on


"Basic
"-----------------------------------------------------------------------
"行番号表示
set number
"不可視文字(TAB,EOF等)を非表示
set list
"カーソル行をハイライト
set cursorline
"カーソル行に罫線
augroup cch
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
"スクロール時の余白確保
set scrolloff=5
"閉じ括弧をハイライト表示
set showmatch
"閉じ括弧をハイライト表示する時間
set matchtime=1
"一行に長文を書いても自動折り返しをしない
set textwidth=0
"ウィンドウ幅より長文になる行の自動折返しをしない
set nowrap
"ターミナル接続を高速化
set ttyfast
"バックスペースで各種消せるようにする
set backspace=indent,eol,start
"OSクリップボードを使用
set clipboard=unnamed,autoselect
"Explorerの初期ディレクトリ
set browsedir=buffer


"Statusline
"-----------------------------------------------------------------------
"ウィンドウ下部にステータスバーを常に表示
set laststatus=2
"ステータスバーのコマンドライン用の画面行数
set cmdheight=1
"ステータスバーに入力中のコマンドの表示
set showcmd
"ステータスバーに現在のモードを表示
set showmode
"ステータスバーにカーソルの行、列数を表示
set ruler
"ステータスバーに変更有無([+])を表示
set statusline=%m
"ステータスバーに読込専用の有無を表示
set statusline+=%r
"ステータスバーにファイル名を表示
set statusline+=%<%F
"ステータスバーに文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"@行間のスペース
set linespace=0
"挿入モード中はステータスバーの色を変更
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END


"Indent
"-----------------------------------------------------------------------
"自動インデントを有効化
set autoindent
"ペースト時にautoindentを無効化
set paste
"ペーストモード(ペースト時インデントズレ無しモード)への切替 F11キー
set pastetoggle=<F11>
"開業時にインデント位置を前行と同じにする
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=0
"Tabを半角スペースに置き換え
set expandtab
set display=lastline
set formatoptions+=mM

if has("autocmd")
  "ファイルタイプに合わせたプラグインを有効化
  filetype plugin on
  "ファイルタイプに合わせたインデントを有効化
  filetype indent on

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
"viとの互換性を取らない
scriptencoding utf-8
"デフォルトのエンコーディング
set encoding =UTF-8
"デフォルトのファイルエンコーディング
set fileencoding=utf-8


"Color
"-----------------------------------------------------------------------
syntax on
highlight LineNr ctermfg=darkgrey


"Backup
"-----------------------------------------------------------------------
"バックアップを作成しない
set nobackup
"swapファイルを作成しない
set noswapfile
"undoファイル(*.un~)を作成しない
set noundofile


"Operation
"-----------------------------------------------------------------------
"ターミナルでマウスを使用可能にする
set mouse=a
set guioptions+=a
"未保存ファイルがある時は終了前に保存確認
set confirm
"複数ファイルの編集を可能にする
set hidden
"内容が編集されたら自動読み込み
set autoread


"Search
"-----------------------------------------------------------------------
"インクリメンタルサーチ
set incsearch
"検索時に大文字小文字を区別しない
set ignorecase
"検索時に結果をハイライト表示
set hlsearch
"検索時にファイル末尾まで進んだらファイル先頭に戻る
set wrapscan
"Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>
imap { {}<Left>

"Window
"-----------------------------------------------------------------------
"Ctrl-hjklでウィンドウ移動
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h
nnoremap L <c-w>l


"Autocomplete
"-----------------------------------------------------------------------
"コマンド補完を強化
set wildmenu
"コマンド補完を開始するキー
set wildchar=<Tab>
"コマンド保管時のモード
set wildmode=list:full

"閉じ括弧の補完
inoremap { {}<Left>
imap [] []<LEFT>
imap () ()<LEFT>
imap '' ''<LEFT>
imap "" ""<LEFT>
imap `` ``<LEFT>
imap \|\| \|\|<Left>

inoremap <expr> = smartchr#one_of(' = ','=',' == ','==',' === ')
inoremap <expr> # smartchr#one_of('# ','#')
inoremap <S-Tab> <C-d>
autocmd BufWritePre * :%s/\s\+$//e


"Bundle Setting/Nertdtree
"-----------------------------------------------------------------------
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
