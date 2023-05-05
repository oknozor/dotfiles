local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("failed to load mason")
  return
end

local mason_lsp_config_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status then
  print("failed to load mason-lspconfig")
  return
end

mason.setup()

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup {
  ensure_installed =  {
    "lua_ls",
    "rust_analyzer",
    "html",
    "tailwindcss",
    "cssls",
    "yamlls",
  }
}

