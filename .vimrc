set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

set number


set tabstop=4
set expandtab

set wildmenu

if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("germguicolors"))
    set termguicolors
  endif
endif

call plug#begin()

Plug 'nanotech/jellybeans.vim'

call plug#end()

set background=dark

colorscheme jellybeans
