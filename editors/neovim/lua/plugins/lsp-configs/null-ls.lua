local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  print("failed to load null_ls")
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.vale,
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.formatting.rustfmt
  },
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
    end
  end,
})
