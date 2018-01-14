"Compatibility
"-----------------------------------------------------------------------
"Disable vi compatible behavior
set nocompatible
"Disable file type
filetype off


"Plugin
"-----------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Plugin manager
Plugin 'VundleVim/Vundle.vim'
"Show directory tree
Plugin 'scrooloose/nerdtree'
"Syntax checker
Plugin 'scrooloose/syntastic'
"Automation for text operation
Plugin 'kana/vim-smartchr'
"Indent
Plugin 'vim-scripts/Super-Shell-Indent'
"UI Integration
Plugin 'Shougo/unite.vim'
"Github client
Plugin 'lambdalisue/gina.vim'
call vundle#end()

filetype plugin indent on


"Basic
"-----------------------------------------------------------------------
"Enable linu number
set number
"Hide invisible character(TAB,EOF...)
set nolist
"Highlight the cursor line
set lines=64 columns=216
"Highlight the cursor line
set cursorline
"Highlight closing parentheses
set showmatch
"Time to Highlight closing parentheses
set matchtime=1
"Display ruled line on cursor line
augroup cch
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
"Speed up terminal connection
set ttyfast
"Auto text wrapping
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
"Enable auto indent
set autoindent
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
  autocmd FileType c          setlocal sw=2 sts=2 ts=2 et
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
  autocmd FileType xml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif


"Encode
"-----------------------------------------------------------------------
"Default encording
set encoding =UTF-8
"Default file encording
set fileencoding=utf-8
"Default script encording
scriptencoding utf-8


"Color
"-----------------------------------------------------------------------
syntax on
syntax enable
set background=dark
"Colorscheme
colorscheme pablo


"Backup
"-----------------------------------------------------------------------
"Do not create backup file(*.txt~)
set nobackup
"Do not create swap file(*.swp)
set noswapfile
"Do not create undo file(*.un~)
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
"Incremental search
set incsearch
"When searching, Do not distinguish case
set ignorecase
"Highlight search results
set hlsearch
"When the search reaches the end, Search again from beginning
set wrapscan
"If you press Esc 2 times, highlight erace
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"Window
"-----------------------------------------------------------------------
"Move between windows with Ctrl-h/j/k/l
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h
nnoremap L <c-w>l


"Autocomplete
"-----------------------------------------------------------------------
"When complementing, Do not distinguish case
set infercase
"Enhanced command complemention
set wildmenu
"Command complemention start key
set wildchar=<Tab>
"Command complemention mode
set wildmode=list:full
"Complemention menu height
set pumheight=10

"Complemention closed parentheses
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap \| \|\|<Left>
inoremap <expr> = smartchr#one_of(' = ','=',' == ','==',' === ')
inoremap <expr> # smartchr#one_of('# ','#')
inoremap <S-Tab> <C-d>
autocmd BufWritePre * :%s/\s\+$//e

syntax on


"Bundle Setting/Nerdtree
"-----------------------------------------------------------------------
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
