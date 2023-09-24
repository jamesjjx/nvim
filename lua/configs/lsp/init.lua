require("configs.lsp.ui")
require("configs.lsp.keymap")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics
  update_in_insert = false,
})

-- LSP servers. Can be installed with :MasonInstall.
require("configs.lsp.lua")
require("configs.lsp.python")
