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
nnoremap('<leader>fgf', [[<cmd>lua require('telescope.builtin').git_files()<cr>]]) -- Find git files
nnoremap('<leader>fb', [[<cmd>lua require('telescope.builtin').file_browser()<cr>]]) -- File Browser
nnoremap('<leader>fw', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]]) -- Find word
nnoremap('<leader>fvh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]]) -- search vim help
nnoremap('<leader>fvc', [[<cmd>lua require('telescope.builtin').commands()<cr>]]) -- find vim command
nnoremap('<leader>fmp', [[<cmd>lua require('telescope.builtin').man_pages()<cr>]]) -- search man pages
nnoremap('<leader>qf', [[<cmd>lua require('telescope.builtin').quickfix()<cr>]]) -- list quick fixes
nnoremap('<leader>ss', [[<cmd>lua require('telescope.builtin').spell_suggest()<cr>]]) -- suggest spelling
nnoremap('<leader>fkm', [[<cmd>lua require('telescope.builtin').keymaps()<cr>]]) -- find keymaps
nnoremap('<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]]) -- show references for obj under cursor
nnoremap('<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]]) -- show symbols in document
nnoremap('<leader>fws', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>]]) -- show symbols in workspace
nnoremap('<leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]]) -- code actions
nnoremap('<leader>fi', [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]])
nnoremap('<leader>fd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]])

-- COC
nmap('<M-CR>', '<Plug>(coc-codeaction)')
nmap('<leader><F6>', '<Plug>(coc-diagnostic-prev)')
nmap('<leader><F5>', '<Plug>(coc-diagnostic-next)')
