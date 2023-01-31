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

local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
  print("failed to load rust_tools")
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

local lsp_selection_range_status, lsp_selection_range = pcall(require, "lsp-selection-range")
if not lsp_selection_range_status then
  print("failed to load lsp-selection-range")
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

-- Todo: extract to default function for rust_tools
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set('n', 'vv', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], opts)
  keymap.set('v', 'vv', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], opts)
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
end

local capabilities = lsp_selection_range.update_capabilities({})

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

lsp_config["sumneko_lua"].setup({
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

-- Rust tools
rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set('n', 'vv', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], opts)
      keymap.set('v', 'vv', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], opts)
      keymap.set("n", "<C-b>", rust_tools.hover_actions.hover_actions, opts)
      keymap.set("n", "<M-CR>", rust_tools.code_action_group.code_action_group, opts)
      keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    end,
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  }
})

rust_tools.hover_actions.hover_actions()

-- Fidget
fidget.setup()
