local key = vim.keymap

key.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Diagnostic keymaps
key.set("n", "<leader>k", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
key.set("n", "<leader>j", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
key.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
key.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- [ Terminal ] --
key.set("t", "<esc>", "<C-\\><C-n><C-W>t", { desc = "Exit terminal mode" })
key.set("n", "<F12>", "<cmd>ToggleTerm<CR>")
key.set("t", "<F12>", "<cmd>ToggleTerm<CR>")

-- [ No arrow keys ! ] --
key.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
key.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
key.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
key.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- [ window focus ] --
key.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
key.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
key.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
key.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- TODO: auto command to dertermine if we should open or close
--
key.set("", "<leader>n", "<cmd>Neotree<CR>")
