syntax on
set backspace=2
set nocompatible
filetype off
set softtabstop=2
set expandtab

set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin("$HOME/vimfiles/bundle")

Plugin 'VundleVim/Vundle.vim'
"Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'



call vundle#end()

filetype on
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8


