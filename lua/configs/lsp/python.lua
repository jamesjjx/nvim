-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp

local exists, lspconfig = pcall(require, "lspconfig")
if not exists then
  return
end

require("lspconfig").pylsp.setup({
  on_attach = require("configs.lsp.keymap").on_attach,
})
