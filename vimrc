set relativenumber 
set number
set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=4     
set expandtab    
set shiftwidth=4
set autoindent 
set smartindent
set cindent

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Indent guide
Plugin 'nathanaelkane/vim-indent-guides'

" Provides insert mode auto-completion for quotes, parens, brackets, etc
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1


let g:indent_guides_enable_on_vim_startup = 1

set ts=4 sw=4 et 
let g:indent_guides_guide_size = 1 
let g:indent_guides_guide_level = 2 

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub

Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"__________AIRLINE___________" 
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plugin 'jacoborus/tender.vim'
"__________NERD_TREE___________" 
Plugin 'scrooloose/nerdtree'

"open with NT if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open with NT if opening a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"ctrl-n shorthcut
map <C-n> :NERDTreeToggle<CR>


" Cursor highlight
Plugin 'RRethy/vim-illuminate'
let g:Illuminate_ftblacklist = ['nerdtree']
" Colors 
if (has("termguicolors"))
 set termguicolors
endif

" Language support 
Plugin 'posva/vim-vue'
" Theme
syntax enable
colorscheme tender
let g:airline_theme = 'tender'
