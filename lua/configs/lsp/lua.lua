local exists, lspconfig = pcall(require, "lspconfig")
if not exists then
  return
end

-- It's automatically configured by neodev.
-- https://github.com/folke/neodev.nvim#-setup
lspconfig.lua_ls.setup({
  on_attach = require("configs.lsp.keymap").on_attach,
  settings = {
    Lua = {},
  },
})
