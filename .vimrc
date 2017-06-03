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
"パッケージ管理
Plugin 'VundleVim/Vundle.vim'
"ディレクトリをTree表示
Plugin 'scrooloose/nerdtree'
"構文チェック
Plugin 'scrooloose/syntastic'
"文字操作系の一部自動化
Plugin 'kana/vim-smartchr'
"インデント整理
Plugin 'vim-scripts/Super-Shell-Indent'
"vim用統合UI
Plugin 'Shougo/unite.vim'
call vundle#end()

filetype plugin indent on

"Basic
"-----------------------------------------------------------------------
"行番号表示
set number
"不可視文字(TAB,EOF等)を非表示
set nolist
"カーソル行をハイライト
set cursorline
"補完の時大文字小文字を区別しない
set infercase
"閉じ括弧をハイライト表示
set showmatch
"閉じ括弧をハイライト表示する時間
set matchtime=1
"カーソル行に罫線
augroup cch
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
"ターミナル接続を高速化
set ttyfast
"ウィンドウ幅より長文になる行の自動折返しをしない
set nowrap
"スクロール時の余白確保
set scrolloff=5
"一行に長文を書いても自動折り返しをしない
set textwidth=0
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
"改行時にインデント位置を前行と同じにする
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=0
"Tabを半角スペースに置き換え
set expandtab
"長文折り返しの複数行を可能な限り表示
set display=lastline
set formatoptions+=mM

if has("autocmd")
  "ファイルタイプに合わせたプラグインを有効化
  filetype plugin on
  "ファイルタイプに合わせたインデントを有効化
  filetype indent on

  "sw=tabstop 新規挿入、シフトオペレータで削除されるスペース数
  "ts=tabstop タブを画面上半角スペースいくつに展開するか
  "sts=softtabstop キーボードでTabキーを押した際に挿入されるスペース数
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
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
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
"バックアップ(*.txt~等)を作成しない
set nobackup
"swapファイル(*.swp等)を作成しない
set noswapfile
"undoファイル(*.un~等)を作成しない
set noundofile


"Operation
"-----------------------------------------------------------------------
"ターミナルでマウスを使用可能にする
set mouse=a
set guioptions+=a
"未保存の更新がある場合は終了前に保存確認
set confirm
"ファイル編集中に他ファイルの編集を可能にする
set hidden
"内容が編集されたら自動読み込み
set autoread


"Search
"-----------------------------------------------------------------------
"インクリメンタルサーチ
set incsearch
"検索時に大文字小文字を区別しない
set ignorecase
"検索結果をハイライト表示
set hlsearch
"検索がファイル末尾まで進んだらファイル先頭から再検索
set wrapscan
"Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>


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
"補完メニューの高さ
set pumheight=10

"閉じ括弧の補完
inoremap { {}<Left>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap `` ``<LEFT>
inoremap \|\| \|\|<Left>

inoremap <expr> = smartchr#one_of(' = ','=',' == ','==',' === ')
inoremap <expr> # smartchr#one_of('# ','#')
inoremap <S-Tab> <C-d>
autocmd BufWritePre * :%s/\s\+$//e

syntax on

"Bundle Setting/Nertdtree
"-----------------------------------------------------------------------
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
