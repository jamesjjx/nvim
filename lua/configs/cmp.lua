local lspkind = require("lspkind")
lspkind.init({
  --preset = 'codicons'
})

local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-y>"] = cmp.mapping.confirm({select = true}),
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
    { name = "nvim_lsp_signature_help" },
  },
  snippet = {
    -- Need a snippet engine to auto complete
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 40, -- half max width
      menu = {
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
      },
    }),
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Search:None", -- "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Search:None", -- "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },

  experimental = {
    --native_menu = false,
    ghost_text = true,
  },
})
