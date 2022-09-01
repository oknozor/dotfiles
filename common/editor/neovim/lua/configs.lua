local HOME = os.getenv( "HOME" )  
local g, o, opt, api = vim.g, vim.o, vim.opt, vim.api

o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.incsearch = true
o.scrolloff = 8
o.signcolumn = "yes"
o.mouse = "a"
o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.cindent = true
o.wildmenu = true
o.clipboard = "unnamedplus"

g.gitgutter_sign_added = ''
g.gitgutter_sign_removed = ''
g.gitgutter_sign_modified = ''

vim.cmd("colorscheme melange")
vim.cmd(':source ' .. HOME .. '/.config/nvim/coc-config.vim')
