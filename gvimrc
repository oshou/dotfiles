"Plugin
"---------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fuenor/qfixgrep.git'
Plugin 'glidenote/memolist.vim'
Plugin 'kana/vim-smartchr'
call vundle#end()
filetype plugin indent on


"Basic
"-----------------------------------------------------------------------
set number
set nolist
set cursorline
set infercase
set showmatch
set matchtime=1
augroup cch
  autocmd!  cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
set ttyfast
set wrap
set scrolloff=5
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set browsedir=""


"StatusLine
"-----------------------------------------------------------------------
set laststatus=2
set cmdheight=1
set showcmd
set showmode
set ruler
set statusline=%m
set statusline+=%r
set statusline+=%<%F
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
set linespace=0
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END

"Indent
"-----------------------------------------------------------------------
set autoindent
set paste
set pastetoggle=<F11>
set smartindent
set expandtab
set display=lastline
set formatoptions+=mM

if has("autocmd")
  filetype plugin on
  filetype indent on

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

"Encode
"-----------------------------------------------------------------------
scriptencoding utf-8
set encoding =UTF-8
set fileencoding=utf-8


"Backup
"-----------------------------------------------------------------------
set nobackup
set noswapfile
set noundofile


"Operation
"-----------------------------------------------------------------------
set mouse=a
set confirm
set hidden
set autoread


"Search
"-----------------------------------------------------------------------
set incsearch
set ignorecase
set hlsearch
set wrapscan
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"Window
"-----------------------------------------------------------------------
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h
nnoremap L <c-w>l
nnoremap < <c-w>>
nnoremap > <c-w><


"AutoComplete
"-----------------------------------------------------------------------
set wildmenu
set wildchar=<Tab>
set wildmode=list:full
set pumheight=10

inoremap { {}<Left>
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap '' ''<Left>
imap "" ""<left>
imap \|\| \|\|<Left>
inoremap <expr> = smartchr#one_of(' = ','=',' == ','==')
inoremap <expr> # smartchr#one_of('# ','#')


"Misc
"-----------------------------------------------------------------------
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

if has("autocmd")
  filetype plugin on
  filetype indent on
endif

syntax on


"for Windows
"---------------------------------------------------------------------------
if 1 && filereadable($VIM . '/gvimrc_local.vim')
  source $VIM/gvimrc_local.vim
  if exists('g:gvimrc_local_finish') && g:gvimrc_local_finish != 0
    finish
  endif
endif

if 0 && exists('$HOME') && filereadable($HOME . '/.gvimrc_first.vim')
  unlet! g:gvimrc_first_finish
  source $HOME/.gvimrc_first.vim
  if exists('g:gvimrc_first_finish') && g:gvimrc_first_finish != 0
    finish
  endif
endif

if 1 && (!exists('g:no_gvimrc_example') || g:no_gvimrc_example == 0)
  source $VIMRUNTIME/gvimrc_example.vim
endif

if has('win32')
  set guifont=terminal:h10:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka?E?等幁Eh14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

set columns=140
set lines=140
set cmdheight=2
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>

if has('multi_byte_ime') || has('xim')
  " IME ON時??Eカーソルの色を設宁E設定侁E紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード??E検索モードでのチE??ォルト??EIME状態設宁E  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設宁E
    " 下記??E s-space はShift+Spaceの意味でkinput2+canna用設宁E    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記??EさせなぁE??合、次行??Eコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif


"Mouse
"---------------------------------------------------------------------------
set mouse=a
set nomousefocus
set mousehide


"Color
"-----------------------------------------------------------------------
syntax on
set t_Co=256
colorscheme pablo


"Plugin - [NERDTree]
"-----------------------------------------------------------------------
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree ./'
nnoremap nt :NERDTreeToggle<CR>
cd $HOME/Documents


"Plugin - [memolist.vim]
"-----------------------------------------------------------------------
let g:memolist_path = "$HOME/Documents/inbox"
let g:memolist_template_dir_path = "template_memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_qfixgrep = 1
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
nnoremap ml :MemoList<CR>
nnoremap mn :MemoNew<CR>
nnoremap mg :MemoGrep<CR>
