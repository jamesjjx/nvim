-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua

local exists, lspconfig = pcall(require, "lspconfig")
if not exists then
  return
end

lspconfig.sumneko_lua.setup({
  on_attach = require("configs.lsp.keymap").on_attach,
  settings = {
    Lua = {
      runtime = {
        version = _VERSION,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("lua", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
