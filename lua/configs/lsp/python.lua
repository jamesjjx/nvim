-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp

local exists, lspconfig = pcall(require, "lspconfig")
if not exists then
  return
end

require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = {
            "E111", -- indent
            "E114", -- comment indent
            "E501", -- long too long
          },
        },
      },
    },
  },
})
