set nocompatible
filetype off
set expandtab

set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
" needs logic to decide whic to use
"set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("$HOME/vimfiles/bundle")

Plugin 'VundleVim/Vundle.vim' "Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'atih/vim-go'
Plugin 'WolfgangMehner/c'
Plugin 'mattn/emmet-vim'
Plugin 'zaiste/tmux.vim'
Plugin 'Onizuka89/vim-tsv'
Plugin 'kchmck/vim-coffee-script'
Plugin 'udalov/kotlin-vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()

syntax on " Will make vim use syntax highlighting on a file being opened
set ruler " vim will display current line, current character in line, and where you are located in the document percentage wise

set encoding=utf-8 " utf-8 input
set fileencodings=utf-8 " utf-8 encoding from files

set ofu=syntaxcomplete#Complete " Allows omni-complete
highlight Pmenu ctermbg=238 gui=bold " line above changes the color of the menu that can appear when you use omni functions
set shell=/bin/bash\ -l " makes vim use a logged in bash shell, allowing usage of your aliases and functions in bash
set backspace=2 " backspace can delete newline
set expandtab " sets vim to use softtabs (tabs => spaces)
set ts=2 " softtab will use 4 spaces
set shiftwidth=2 " shift of ident is 4 spaces
au BufNewFile,BufRead *.m set filetype=objc " When reading files with .m or .h extension assume it is a objective-c source code file
au BufNewFile,BufRead *.h set filetype=objc
au BufNewFile,BufRead *.txt set filetype=txt " when reading a file with .txt assume it is a text file
set nu " display the number of the lines on the left
setlocal spelllang=en_us  " default spelling language set to US english
" nmap <leader>l :set list!<CR>   " supposed to make l show invisible
" characters like new line
set listchars=tab:▷\ ,eol:$  " when activating list tab and end of line will be set to these
colorscheme elflord " a colorscheme theme for vim


"execute "colorscheme ".c  " a colorscheme theme for vim
set showcmd " displays commands being used in command mode, like the counter
set autowrite " writes changes in buffer when changing buffer (like when you use n in command mode to move to next buffer).
set incsearch " display match as you type
set hlsearch " highlights all matches after search :noremap <F4> :set hlsearch! hlsearch?<CR> " toggle the highlight from search by pressing F4
set smartindent " two different ways to make vim indent automatically
set autoindent
set laststatus=2 " status line will always be displayed, even in single view

filetype plugin indent on

"vim notes
":set all - displays a list of all options available for set.
":set - displays options that you have specifically set
"
"
"Might be interesting options for programmers:
"autoindent,showmatch,tabstop,shiftwidth,number, and list
let @t="it('')h"
let @h="i<%=  %>3ha"

"execute pathogen#infect()


"set nrformats=


"autocmd BufRead    *.txt,README,TODO,CHANGELOG,NOTES if getline(1) =~ '^//asciidoc'   | setlocal filetype=asciidoc | endif

