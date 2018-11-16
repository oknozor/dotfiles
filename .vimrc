syntax on
set relativenumber 
set number
set nocompatible     
filetype off        
set tabstop=4     
set expandtab    
set shiftwidth=4
set autoindent 
set smartindent
set cindent

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'gisphm/vim-gitignore'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


