local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  print("failed to load lualine")
  return
end

lualine.setup {
  options = {
    theme = 'gruvbox_dark'
  }
}
