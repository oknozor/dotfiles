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

" Scroll
nnoremap <A-j> <C-f>
nnoremap <A-k> <C-b>

" Active window
nnoremap <C-j>  <C-w><C-j>
nnoremap <C-k>  <C-w><C-k>
nnoremap <C-h>  <C-w><C-h>
nnoremap <C-l>  <C-w><C-l>

" Switch buffer
nnoremap <A-h> :bp<Cr>
nnoremap <A-l> :bn<Cr>

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
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-fugitive'

    " Linters 
    Plug 'pearofducks/ansible-vim'
    Plug 'rust-lang/rust.vim'
    Plug 'aliou/bats.vim'
    Plug 'hashivim/vim-vagrant'
    Plug 'chr4/nginx.vim'
    Plug 'racer-rust/vim-racer'
    Plug 'cespare/vim-toml'

    " Language integration
    Plug 'w0rp/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""" COC 
    noremap <leader>g :CocList files<CR> 
    noremap <leader>G :CocList symbols<CR> 
    noremap <leader>f :CocList grep<CR> 

    "" Go to Actions 
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    "" Hint
    highlight link CocErrorSign GruvboxRed

    "" Documentation
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
"""

" Ale Lint 
nnoremap <silent> <A-n> :ALEDetail<Cr>
nmap <silent> <C-UP> <Plug>(ale_previous_wrap)
nmap <silent> <C-DOWN> <Plug>(ale_next_wrap)
let g:ale_completion_enabled = 1
let g:ale_update_tagstack = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '-'
let g:ale_sign_warning = '-' 
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline_powerline_fonts = 1

" Linters 
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'bats': ['shellcheck'],
\   'rust': ['cargo clippy'],
\}

" Yank highlight
nnoremap <leader>y  :<C-u>CocList -A --normal yank<cr>

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" Gitgutter 

let g:gitgutter_sign_added = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified = ''

" Tender
if (has("termguicolors"))
 set termguicolors
endi

" Delimite mate
let delimitMate_expand_cr = 1

colorscheme tender
highlight Pmenu guibg=SlateGrey gui=bold
