local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
  print("failed to load treesitter")
  return
end


treesitter.setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "help",
    "rust",
    "javascript",
    "java",
    "rust",
    "json",
    "toml",
    "markdown",
    "yaml",
    "gitignore",
    "gitattributes",
    "dockerfile",
  },

  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gn",
      node_incremental = "gc",
      scope_incremental = "gv",
      node_decremental = "gr",
    },
  },
})
