return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "💡",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("saga-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("K", "<cmd>Lspsaga hover_doc<CR>", "open symbol documentation")
				map("<leader>S", "<cmd>Lspsaga outline<CR>", "Show file structure")
				map("<leader>a", "<cmd>Lspsaga code_action<CR>", "Code actions")
			end,
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
