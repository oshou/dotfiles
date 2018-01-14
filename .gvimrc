"Plugin
"---------------------------------------------------------------------------
call vundle#begin()
Plugin 'fuenor/qfixgrep.git'
Plugin 'glidenote/memolist.vim'
call vundle#end()
filetype plugin indent on


"Operation
"-----------------------------------------------------------------------
"ターミナルでマウスを使用可能にする
set mouse=a
set guioptions+=a


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
set nomousefocus
set mousehide


"Plugin - [NERDTree]
"-----------------------------------------------------------------------
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
