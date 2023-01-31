
local HOME = os.getenv( "HOME" )  
local g, o, opt, api = vim.g, vim.o, vim.opt, vim.api

o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.incsearch = true
o.scrolloff = 8
o.mouse = "a"
o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.cindent = true
o.wildmenu = true
o.clipboard = "unnamedplus"
o.autowrite = true

o.updatetime = 300
o.backup = false
o.writebackup = false
o.signcolumn = "yes"

g.gitgutter_sign_added = ''
g.gitgutter_sign_removed = ''
g.gitgutter_sign_modified = ''

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd("colorscheme melange")
