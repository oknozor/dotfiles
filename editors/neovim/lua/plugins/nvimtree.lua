local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status then
  print("failed to load nvim_tree")
  return
end

nvim_tree.setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    adaptive_size = true,
  },
}

