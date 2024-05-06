vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("opts")
require("keymap")
require("lazy").setup({
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	"nvim-lualine/lualine.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "numtostr/comment.nvim", opts = {} },
	{ require("plugins.telescope") },
	{ require("plugins.noice") },
	{ "lvimuser/lsp-inlayhints.nvim" },
	{ require("plugins.lsp-config") },
	{ require("plugins.crates") },
	{ require("plugins.nvim-cmp") },
	{ require("plugins.treesitter") },
	{ require("plugins.conform") },
	{ require("plugins.neotree") },
	{ require("plugins.saga") },
	{ "Pocco81/auto-save.nvim" },
	{ require("plugins.autopair") },
})

require("au")

vim.cmd.colorscheme("catppuccin-frappe")
