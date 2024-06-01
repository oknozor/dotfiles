return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"vim",
			"vimdoc",
			"javascript",
			"java",
			"rust",
			"json",
			"toml",
			"markdown",
			"markdown_inline",
			"yaml",
			"gitignore",
			"gitattributes",
			"dockerfile",
			"typescript",
		},
		auto_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>vv",
				node_incremental = "<leader>)",
				scope_incremental = "<leader>=",
				node_decremental = "<leader>à",
			},
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}
