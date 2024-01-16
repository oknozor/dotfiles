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


local rust_tools_opts = {
  tools = {
    -- how to execute terminal commands
    -- options right now: termopen / quickfix / toggleterm / vimux
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  -- server setup
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set("n", "<F9>", "<cmd>RustRunnables<CR>", opts)
    end,
  },

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}
rust_tools.setup(rust_tools_opts)




-- Fidget
fidget.setup()
