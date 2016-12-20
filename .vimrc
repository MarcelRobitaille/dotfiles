" Vim settings
set nocompatible
filetype off


" ================ Vundle ======================

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" Tree view
"Plugin 'scrooloose/nerdtree'

" Fuzzy file finder
"Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
"call vundle#end()
filetype plugin indent on

" Line numbers
set number

" Syntax highlighting
syntax on

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
