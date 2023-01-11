local vim, api, fn, g = vim, vim.api, vim.fn, vim.g
local mappings = require('lib.keymap')

-- dereference all the functions
-- examples https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_mapping.lua
local nnoremap = mappings.nnoremap
local inoremap = mappings.inoremap
local vnoremap = mappings.vnoremap
local xnoremap = mappings.xnoremap
local cnoremap = mappings.cnoremap
local tnoremap = mappings.tnoremap
local nmap = mappings.nmap
local map = mappings.map
local imap = mappings.imap
local vmap = mappings.vmap
local xmap = mappings.xmap


g.mapleader = ","

-- tab navigation
nnoremap('<leader>k', '<esc>:tabprevious<CR>')
nnoremap('<leader>j', '<esc>:tabnext<CR>')
nnoremap('<leader>t', '<esc>:tabnew<CR>')

-- split window <leader> h/v
nnoremap('<leader>h', ':split<CR>')
nnoremap('<leader>v', ':vsplit<CR>')

-- rearrange windows with `<leader>+H/J/K/L`
nnoremap('<leader>J', '<C-W>J')
nnoremap('<leader>K', '<C-W>K')
nnoremap('<leader>H', '<C-W>H')
nnoremap('<leader>L', '<C-W>L')

-- move focus with Ctrl+h/j/k/l
tnoremap('<C-h>', '<C-\\><C-N><C-w>h')
tnoremap('<C-j>', '<C-\\><C-N><C-w>j')
tnoremap('<C-k>', '<C-\\><C-N><C-w>k')
tnoremap('<C-l>', '<C-\\><C-N><C-w>l')

inoremap('<C-h>', '<C-\\><C-N><C-w>h')
inoremap('<C-j>', '<C-\\><C-N><C-w>j')
inoremap('<C-k>', '<C-\\><C-N><C-w>k')
inoremap('<C-l>', '<C-\\><C-N><C-w>l')

nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

-- replace ESC with jk
inoremap('jk', '<esc>')
vnoremap('jk', '<esc>')
imap('<esc>', '<nop>')
vmap('<esc>', '<nop>')

map('<F2>', ':set hlsearch! hlsearch?<CR>')

-- ToogleTerm 
tnoremap('<esc>', '<C-\\><C-n><C-W>t')
map('<F12>', '<cmd>ToggleTerm<CR>')
tnoremap('<F12>', '<cmd>ToggleTerm<CR>')

-- NvimTree
nnoremap("<leader>n", ":NvimTreeFindFileToggle<CR>")

-- Telescope
map('<C-!>', '<cmd>Telescope projects<CR>')
map('<C-n>', '<cmd>Telescope find_files<CR>')
map('<C-,>', '<cmd>Telescope coc workspace_symbols<CR>')
map('<C-;>', '<cmd>Telescope  live_grep<CR>')

-- COC
nmap('<leader>a', '<Plug>(coc-codeaction)')
xmap('<leader>a', '<Plug>(coc-codeaction)')
nmap('<M-CR>', '<Plug>(coc-codeaction-selected)')
xmap('<M-CR>', '<Plug>(coc-codeaction-selected)')
nmap('<S-F6>', '<cmd>CocCommand document.renameCurrentWord<CR>')
nmap('<leader><F6>', '<Plug>(coc-diagnostic-prev)')
nmap('<leader><F5>', '<Plug>(coc-diagnostic-next)')
