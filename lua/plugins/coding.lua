return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
        { name = "nvim_lsp_signature_help" },
      },
    },
  },
}
