syntax on
set number
set relativenumber
set nocompatible
filetype off
set tabstop=2 
set expandtab    
set shiftwidth=2
set autoindent 
set smartindent
set cindent
set wildmenu
set undofile
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set updatetime=250
set autowriteall
set clipboard+=unnamedplus

if !exists("rc_autocommands_loaded")
    " Todo make a file type for sway config
	  let rc_autocommands_loaded = 1
    au BufRead,BufNewFile ~/.config/sway/* setfiletype sway
    " Always enter terminal window in insertion mode
    au TermEnter * startinsert
endif

command! Cheatsheet !xdg-open https://github.com/oknozor/dotfiles/blob/master/docs/nvim_cheatsheet.md<CR>

let mapleader="," 

" WARNING : If you are using my dotfiles you probably want to delete this
" it remap the <esc> key to jk
inoremap jk <esc>
vnoremap jk <esc>

" WARNING : disable arrow keys and mouse scroll
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

" Handy shortcut to enable/disable search highliting
noremap <F2> :set hlsearch! hlsearch?<CR>


" Window and navigation
  " Remap left and right arrow keys to tabprev and tabnext 
  " Todo make a file type for sway config
  nnoremap <left>     :tabprevious<CR>
  nnoremap <right>    :tabnext<CR>
  "
  " Alternatively use `<leader>j/k for tabnext/tabprev
  nnoremap <leader>k  <esc>:tabprevious<CR>
  nnoremap <leader>j  <esc>:tabnext<CR> 
  nnoremap <leader>t  <esc>:tabnew<CR>
  "
  " use `<leader>t`h to create a new tab
  nnoremap <leader>t  :tabnew<CR>


  " Split window 
  " `<leader>d/v` to split horizontal/vertical
  noremap <leader>h :split<CR>
  nnoremap <leader>v :vsplit<CR>

  " `Alt+j/k` to scroll down/up
  nnoremap <A-j> <C-f>
  nnoremap <A-k> <C-b>

  " Rearrange windows with `<leader>+H/J/K/L`
  nnoremap <leader>J <C-W>J
  nnoremap <leader>K <C-W>K
  nnoremap <leader>H <C-W>H
  nnoremap <leader>L <C-W>L
  "
  " Move focus with Ctrl+h/j/k/l
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l

  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

" Terminal
" To exit insert mode in terminal escape is used instead of `jk`
tnoremap <Esc> <C-\><C-n>
" `<leader>+x` to open a terminal in insert mode
noremap <leader>x :split<CR><C-W>J :res 15<CR> :terminal<CR>

" Switch buffer with `Alt+h/l`
nnoremap <A-h> :bp<Cr>
nnoremap <A-l> :bn<Cr>

" Quick edit and source

    " .vimrc
    nnoremap <leader>ev :vsplit $NVIMRC<CR>
    nnoremap <leader>sv :source $NVIMRC<CR>
    
    " .zshrc
    nnoremap <leader>ez :vsplit $SHELL_RC<CR>
    nnoremap <leader>sz :!source $SHELL_RC<CR>
    
    " sway
    nnoremap <leader>es :tabnew <CR>

" Edition 

  " Move a line down/up with `+/-`
  nnoremap + ddp
  nnoremap - ddkkp


  " Lowecase/uppercase a word : `<leader>+l\u`
  noremap <leader>u viwU<esc> 
  noremap <leader>l viwu<esc> 
  "
  " quote/parenthesize a word with `<leader>+{quote_type}`
  nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
  nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
  nnoremap <leader>è viw<esc>a`<esc>bi`<esc>lel
  nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
  nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
  nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel

  " quote/parenthesize selection mode with `<leader>+{quote_type}` in visual
  " mode
  vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>lel
  vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>lel
  vnoremap <leader>è <esc>`<i`<esc>`>a`<esc>lel
  vnoremap <leader>{ <esc>`<i{<esc>`>a}<esc>lel
  vnoremap <leader>( <esc>`<i(<esc>`>a)<esc>lel
  vnoremap <leader>[ <esc>`<i[<esc>`>a]<esc>lel


" Plugin
call plug#begin('~/.vim/plugged')

    " Ui 
    Plug 'oknozor/illumination', { 'dir': '~/.illumination', 'do': './install.sh' }
    Plug 'scrooloose/nerdtree'
    Plug 'Raimondi/delimitMate'
    Plug 'airblade/vim-gitgutter'
    Plug 'liuchengxu/eleline.vim'

    " Tools 
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-fugitive'

    " Linters 
    Plug 'pearofducks/ansible-vim'
    Plug 'rust-lang/rust.vim'
    Plug 'aliou/bats.vim'
    Plug 'hashivim/vim-vagrant'
    Plug 'chr4/nginx.vim'
    Plug 'cespare/vim-toml'
    "
    " Language integration
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'elkowar/yuck.vim'
    
    " Theme
    Plug 'overcache/NeoSolarized'
    "Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

set background=dark
colorscheme NeoSolarized

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

" Colors and Themes 
  " Enable true colors
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif


  filetype plugin indent on   
  set cursorline

 " Always display statusline.
set laststatus=2

" Gitgutter 
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified = ''

" Delimite mate
let delimitMate_expand_cr = 1

source ~/.config/nvim/coc-config.vim
