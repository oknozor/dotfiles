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

" Fyle types
au BufRead,BufNewFile ~/.config/sway/config setfiletype sway

" Cursor color 
if &term =~ "termite"
  let &t_SI = "\<Esc>]12;red\x7"
  let &t_EI = "\<Esc>]12;blue\x7"
  silent !echo -ne "\033]12;blue\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

" Disable arrow keys and mouse scroll
imap <esc> <nop>
vmap <esc> <nop>
map <ScrollWheelUp> <nop>
map <ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
map <ScrollWheelDown> <nop>

nnoremap <Right> <nop>
nnoremap <Up>    <nop> 
nnoremap <Down>  <nop>
nnoremap <esc>   <nop>

vnoremap <Right> <nop>
vnoremap <Up>    <nop> 
vnoremap <Down>  <nop>
vnoremap <esc>   <nop>

" Fix arrow and scroll remaping 
"noremap OA <esc>
"noremap OB <esc>
"noremap OC <esc>
"noremap OD <esc>

" Toggle hl
noremap <F2> :set hlsearch! hlsearch?<CR>


" Tab navigation
nnoremap <left>     :tabprevious<CR>
nnoremap <right>    :tabnext<CR>
nnoremap <leader>t  :tabnew<CR>

nnoremap <leader>k  <esc>:tabprevious<CR>
nnoremap <leader>j  <esc>:tabnext<CR>
nnoremap <leader>t  <esc>:tabnew<CR>

nnoremap <leader>d :split<CR>
nnoremap <leader>v :vsplit<CR>

nnoremap <C-j>  <C-w><C-j>
nnoremap <C-k>  <C-w><C-k>
nnoremap <C-h>  <C-w><C-h>
nnoremap <C-l>  <C-w><C-l>

" Quick edit and source 

    " .vimrc
    nnoremap <leader>ev :tabnew $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
    " .zshrc
    nnoremap <leader>ez :tabnew $MY_ZSHRC<CR>
    nnoremap <leader>sz :!source $MY_ZSHRC<CR>
    " sway
    nnoremap <leader>es :tabnew ~/.config/sway/config<CR>
    nnoremap <leader>ss :tabnew ~/.config/sway/status.toml<CR>

" Normal mode remap
inoremap jk <esc>
vnoremap jk <esc>

" Edition 
nnoremap + ddp
nnoremap - ddkkp

noremap <leader>u viwU<esc> 
noremap <leader>l viwu<esc> 

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>lel

" Terminal
noremap <leader>x :split<esc><CR><C-W>J :res 10<CR> :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Abbreviations
ab @@ paul.defosse@protonmail.com
autocmd FileType c iabbrev <buffer> iff if(x)<Left><Backspace>

" Plugin
call plug#begin('~/.vim/plugged')

    " Ui 
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'
    Plug 'jacoborus/tender.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'airblade/vim-gitgutter'

    " Tools 
    Plug 'RRethy/vim-illuminate'

    " Linters 
    Plug 'pearofducks/ansible-vim'
    Plug 'rust-lang/rust.vim'
    Plug 'aliou/bats.vim'
    Plug 'hashivim/vim-vagrant'
    Plug 'chr4/nginx.vim'
    Plug 'racer-rust/vim-racer'

    " Language integration
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim', 
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

    Plug 'junegunn/fzf'

call plug#end()

" Language client 
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
"
" Deoplete
let g:deoplete#enable_at_startup = 1

" Ale Lint 
nnoremap <silent> <ALT-l> :ALEDetail<Cr>
nmap <silent> <ALT-k> <Plug>(ale_previous_wrap)
nmap <silent> <ALT-j> <Plug>(ale_next_wrap)
let g:ale_completion_enabled = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '-'
let g:ale_sign_warning = '-' 
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline_powerline_fonts = 1

" Linters 
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'bats': ['shellcheck'],
\}

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:lightline = { 'colorscheme': 'tender' }
let g:airline_theme = 'tender'

" Tender
if (has("termguicolors"))
 set termguicolors
endi

" Delimite mate
let delimitMate_expand_cr = 1

colorscheme tender

" Rust autocompletion
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

