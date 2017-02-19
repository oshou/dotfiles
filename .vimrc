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
Plugin 'glidenote/memolist.vim'
Plugin 'kana/vim-smartchr'
Plugin 'vim-scripts/Super-Shell-Indent'
call vundle#end()


"Basic
"-----------------------------------------------------------------------
set number              "行番号表示
set nolist              "不可視文字(TAB、EOF等)を非表示
set cursorline          "カーソル行をハイライト
augroup cch             "カーソル行に罫線
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
set scrolloff=5         "スクロール時の余白確保
set showmatch           "閉じ括弧をハイライト表示
set matchtime=1         "閉じ括弧をハイライト表示する時間
set textwidth=0         "一行に長い文章を書いても自動折り返しをしない
set nowrap              "ウィンドウ幅より長い行の自動折り返しをしない
set ttyfast             "ターミナル接続を高速化
set backspace=indent,eol,start  "バックスペースで各種消せるようにする
set clipboard=unnamed,autoselect   "OSクリップボードを使用
set browsedir=buffer    "Explorerの初期ディレクトリ


"Statusline
"-----------------------------------------------------------------------
set laststatus=2        "ウィンドウ下部にステータスバーを常に表示
set cmdheight=1         "ステータスバーのコマンドライン用の画面行数
set showcmd             "ステータスバーに入力中のコマンドを表示
set showmode            "ステータスバーに現在のモードを表示"
set ruler               "ステータスバーにカーソルの行数、列数を表示
set statusline=%m       "ステータスバーに変更有無([+])を表示
set statusline+=%r      "ステータスバーに読み込み専用の有無を表示
"set statusline+=%{matchstr(hostname(),'\\w\\+')}@  "ステータスバーにホスト名を表示
set statusline+=%<%F    "ステータスバーにファイル名を表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}] "ステータスバーに文字コード表示
set linespace=0

augroup InsertHook      "挿入モード中はステータスバーの色を変更
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END


"Indent
"-----------------------------------------------------------------------
set autoindent          "自動インデントを有効化
set paste               "ペースト時にautoindentを無効にする
set smartindent         "改行時にインデント位置を前行と同じにする
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab           "TABを半角スペースで挿入
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
scriptencoding utf-8    "viとの互換性を取らない
set encoding =UTF-8     "デフォルトのエンコーディング
set fileencoding=utf-8  "デフォルトのファイルエンコーディング


"Color
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
set mouse=a             "ターミナルでマウスを使用可能にする
set guioptions+=a
set confirm             "未保存ファイルがある時は終了前に保存確認
set hidden              "複数ファイルの編集を可能にする
set autoread            "内容が編集されたら自動再読込
set pastetoggle=


"Search
"-----------------------------------------------------------------------
set incsearch           "インクリメンタルサーチ
set ignorecase          "検索時に大文字小文字を区別しない
set hlsearch            "検索時に結果をハイライト表示
set wrapscan            "検索時にファイル末尾まで進んだらファイル先頭に戻る
nmap <ESC><ESC> ;nohlsearch<CR><ESC>   "Escキー2回押しでハイライト消去


"Window
"-----------------------------------------------------------------------
"Ctrl-hjklでウィンドウ移動
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h
nnoremap L <c-w>l


"Autocomplete
"-----------------------------------------------------------------------
set wildmenu            "コマンド補完を強化
set wildchar=<TAB>      "コマンド補完を開始するキー
set wildmode=list:full  "コマンド補完時のモード(リスト表示、最長マッチ)
set infercase           "コマンド補完時に大文字小文字を区別しない

"閉じ括弧の補完
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


"Bundle Setting/Nertdtree
"-----------------------------------------------------------------------
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif


"Bundle Setting/memolist
"-----------------------------------------------------------------------
let g:memolist_path = "C:\Users\usr0301430\Documents\works\logs\memolist"
let g:memolist_gfixgrep = 1
let g:memolist_unite = 1
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>
