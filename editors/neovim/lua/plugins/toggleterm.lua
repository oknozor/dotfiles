local toggleterm_status, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status then
  print("failed to load toggleterm")
  return
end

toggleterm.setup({
  shell = '/usr/bin/zsh'
})
