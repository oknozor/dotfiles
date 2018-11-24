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
set wildmenu
set undofile
set nobackup
set updatetime=250
set autowriteall

let mapleader="," 
let maplocalleader="!"

" Cursor color 
if &term =~ "termite"
  let &t_SI = "\<Esc>]12;red\x7"
  let &t_EI = "\<Esc>]12;blue\x7"
  silent !echo -ne "\033]12;blue\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

" No pain no gain   
imap <esc> <nop>
vmap <esc> <nop>
map <ScrollWheelUp> <nop>
map <ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
map <ScrollWheelDown> <nop>

inoremap <Left>  <nop>
inoremap <Right> <nop>
inoremap <Up>    <nop> 
inoremap <Down>  <nop>

nnoremap <Right> <nop>
nnoremap <Up>    <nop> 
nnoremap <Down>  <nop>
nnoremap <esc>   <nop>

vnoremap <Right> <nop>
vnoremap <Up>    <nop> 
vnoremap <Down>  <nop>
vnoremap <esc>   <nop>

" Fix arrow and scroll remaping, might need to change those on other OSes
noremap OA <esc>
noremap OB <esc>
noremap OC <esc>
noremap OD <esc>

" Tab navigation
nnoremap <leader>h  :tabprevious<CR>
nnoremap <leader>l  :tabnext<CR>
nnoremap <leader>t  :tabnew<CR>

inoremap <leader>h  :tabprevious<CR>
inoremap <leader>l  :tabnext<CR>
inoremap <leader>t   <Esc>:tabnew<CR>

nnoremap <leader>d :split<CR>
nnoremap <leader>v :vsplit<CR>

" Edit and source .vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Normal mode remap
inoremap jk <esc>
vnoremap jk <esc>

" Edition 
nnoremap + ddp
nnoremap - ddkkp
noremap <leader>u viwU<esc> 
noremap <leader>l viwu<esc> 
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Macros 
nnoremap <leader>m @e 
inoremap <leader>m <esc>@e

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jacoborus/tender.vim'
Plugin 'RRethy/vim-illuminate'
Plugin 'vim-syntastic/syntastic.git'
" see https://github.com/pearofducks/ansible-vim for filetype matching.
Plugin 'pearofducks/ansible-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'Tagbar'
Plugin 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }


call vundle#end()          

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on   

"Illuminate 
let g:Illuminate_ftblacklist = ['nerdtree']
let g:Illuminate_ftHighlightGroups = {
      \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
      \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
      \ }
" Airline 
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tender
if (has("termguicolors"))
 set termguicolors
endi

let g:lightline = { 'colorscheme': 'tender' }
let g:airline_theme = 'tender'
colorscheme tender

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntax checkers  
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_ansible_ansible_lint_exec = ['/usr/bin/ansible-lint']
let g:syntastic_ansible_checkers = ['ansible_lint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_yaml_yaml_lint_exec = '/usr/bin/yamllint'
let g:rustfmt_autosave = 1

" Rust autocompletion with racer
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Tagbar 
nnoremap <leader>t :TagbarToggle<CR>
