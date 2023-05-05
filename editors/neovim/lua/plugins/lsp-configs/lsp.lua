-- Lsp config
local lsp_config_status, lsp_config = pcall(require, "lspconfig")
if not lsp_config_status then
  print("failed to load lspconfig")
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("failed to load cmp-nvim-lsp")
  return
end

local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
  print("failed to load neodev")
  return
end

local fidget_status, fidget = pcall(require, "fidget")
if not fidget_status then
  print("failed to load fidget")
  return
end

neodev.setup({
  library = {
    enabled = true,
    runtime = true,
    types = true,
    plugins = true,
  },
  setup_jsonls = true,
  lspconfig = true,
  pathStrict = true,
})

local keymap = vim.keymap

-- Null ls formatting
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach_format = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local on_attach = function(client, bufnr)
  on_attach_format(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "gs", "<cmd>Lspsaga outline<CR>", opts)
  keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
  keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "gq", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lsp_config["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lsp_config["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lsp_config["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lsp_config["lua_ls"].setup({
  capabilities =capabilities,
  on_attach = on_attach,
  settings = {
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config")] = true,
      }
    }
  }
})


-- Rust 
local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
  print("failed to load rust-tools")
  return
end


rust_tools.setup({
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set("n", "<F9>", "<cmd>RustRunnables<CR>", opts)
    end,
  },
})

-- Fidget
fidget.setup()
