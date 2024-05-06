local o = vim.opt

-- [ Opts ] --
o.number = true
o.showmode = false
o.clipboard = "unnamedplus"
o.breakindent = true
o.undofile = true
o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.cindent = true
o.softtabstop = 2
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.inccommand = "split"
o.cursorline = true
o.scrolloff = 10
o.hlsearch = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter.foldexpr()"
o.foldenable = true
o.mouse = ""
o.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%{v:lnum}%r│%T"
vim.wo.signcolumn = "yes"
vim.g.have_nerd_font = true
