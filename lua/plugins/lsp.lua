return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = { current_line = true },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
