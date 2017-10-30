"-----------------------------------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/dot/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/dot/.vim/dein/')
  call dein#begin('/home/dot/.vim/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/dot/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " auto complete
  if has('lua')
    call dein#add('Shougo/neocomplete')
  else
    call dein#add('Shougo/neocomplcache.vim')
  endif

  call dein#add('scrooloose/nerdtree')
  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#add('Shougo/unite.vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('soramugi/auto-ctags.vim')


  " color scheme
  call dein#add('google/vim-colorscheme-primary')
  call dein#add('tomasr/molokai')
  call dein#add('aereal/vim-colors-japanesque')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want delete some plugin, enable the blow.
" and, restart the VIM
" after restarted, exec this command
" :call dein#recache_runtimepath()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"-----------------------------------------
" Personal Setup
filetype plugin indent on
syntax enable
colorscheme primary
set t_Co=256
set background=dark
set number
set showmatch
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set whichwrap=b,s,h,l,<,>,[,]

" auto comment off
augroup auto_comment_off
    autocmd!
    autocmd BUfEnter * setlocal formatoptions-=r
    autocmd BUfEnter * setlocal formatoptions-=o
augroup END

" load more configs
runtime! plugin_conf/*.vim
runtime! key_bind/*.vim

" auto complete
if has('lua')
  runtime! plugin_conf/neocomp/neocomplete.vim
else
  runtime! plugin_conf/neocomp/neocomplcache.vim
endif