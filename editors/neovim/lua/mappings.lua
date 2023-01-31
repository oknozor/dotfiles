local vim, api, fn, g = vim, vim.api, vim.fn, vim.g
local mappings = require('lib.keymap')

-- dereference all the functions
-- examples https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_mapping.lua
local nnoremap = mappings.nnoremap
local inoremap = mappings.inoremap
local tnoremap = mappings.tnoremap
local map = mappings.map

g.mapleader = ","

-- tab navigation
nnoremap('<leader>k', '<esc>:bprevious<CR>')
nnoremap('<leader>j', '<esc>:bnext<CR>')
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

map('<F2>', ':set hlsearch! hlsearch?<CR>')

-- ToogleTerm 
tnoremap('<esc>', '<C-\\><C-n><C-W>t')
map('<F12>', '<cmd>ToggleTerm<CR>')
tnoremap('<F12>', '<cmd>ToggleTerm<CR>')

-- NvimTree
nnoremap("<leader>n", ":NvimTreeFindFileToggle<CR>")

-- Telescope
map('<leader>p', '<cmd>Telescope projects<CR>')
map('<leader>f', '<cmd>Telescope find_files<CR>')
map('<leader>;', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
map('<leader>!', '<cmd>Telescope  live_grep<CR>')
