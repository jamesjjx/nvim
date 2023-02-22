require("configs.lsp.ui")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics
  update_in_insert = false,
})

-- LSP servers.
require("configs.lsp.sumneko_lua")
require("configs.lsp.python")
