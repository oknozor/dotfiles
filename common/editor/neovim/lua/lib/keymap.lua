local api = vim.api

local M = {}

function M.map(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('', lhs, rhs, options)
end

function M.nmap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('n', lhs, rhs, options)
end

function M.vmap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('v', lhs, rhs, options)
end

function M.smap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('s', lhs, rhs, options)
end

function M.xmap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('x', lhs, rhs, options)
end

function M.imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('i', lhs, rhs, options)
end

function M.lmap(lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('i', lhs, rhs, options)
end

function M.cmap(lhs, rhs, opts)
    local options = { noremap = false, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('c', lhs, rhs, options)
end

function M.tmap(lhs, rhs, opts)
    local options = { noremap = false, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('t', lhs, rhs, options)
end
  
function M.map(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('', lhs, rhs, options)
end

function M.nnoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('n', lhs, rhs, options)
end

function M.vnoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('v', lhs, rhs, options)
end

function M.snoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('s', lhs, rhs, options)
end

function M.xnoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('x', lhs, rhs, options)
end

function M.inoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('i', lhs, rhs, options)
end

function M.lnoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('i', lhs, rhs, options)
end

function M.cnoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('c', lhs, rhs, options)
end

function M.tnoremap(lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('t', lhs, rhs, options)
end

return M

