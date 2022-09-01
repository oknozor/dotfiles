require('nvim-tree').setup { 
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "g", action = "cd" },
      },
    },
  },
}

