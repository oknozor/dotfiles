local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  print("failed to load lspsaga")
  return
end

saga.setup({
  config = {
    scroll_preview = {
      scroll_down = "<C-j>",
      scroll_up = "<C-k>",
    },
    finder = {
      jump_to = 'p',
      edit = { "o", "<CR>" },
      vsplit = "<leader>v",
      split = "<leader>h",
      tabe = "t",
      quit = { "q", "<ESC>" },
    },
    ui = {
      theme = "round",
      title = true,
      border = "rounded",
      winblend = 0,
      expand = "",
      collapse = "",
      preview = " ",
      code_action = "💡",
      diagnostic = "🐞",
      incoming = " ",
      outgoing = " ",
      hover = ' ',
      kind = {},
    },
  }
})
