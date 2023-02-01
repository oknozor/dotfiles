local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  print("failed to load lspsaga")
  return
end

saga.setup({
  scroll_preview = {
    scroll_down = "<C-j>",
    scroll_up = "<C-k>",
  },
  finder = {
    jump_to = 'p',
    edit = { "o", "<CR>" },
    vsplit = "v",
    split = "h",
    tabe = "t",
    quit = { "q", "<ESC>" },
  },
  code_action = {
    num_shortcut = true,
    keys = {
      quit = "<ESC>",
      exec = "<CR>",
    },
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
})
