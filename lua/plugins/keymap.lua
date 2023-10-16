-- Keymap configs for various plugins.
local cmp = require("cmp")

return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      {
        "<C-j>",
        function()
          require("luasnip").expand_or_jump()
        end,
        mode = "i",
      },
      {
        "<C-j>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<C-k>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      },
    },
  },
  {
    "neovim/nvim-lspconfig",

    init = function()
      -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = {
        "<leader>l",
        function()
          local line = vim.api.nvim_win_get_cursor(0)[1]
          vim.lsp.buf.format({
            range = { ["start"] = { line, 0 }, ["end"] = { line, 1000 } },
          })
        end,
        desc = "LSP line formatting",
      }
      keys[#keys + 1] = {
        "gl",
        "<cmd>lua vim.lsp.buf.format()<CR><ESC>",
        mode = "x",
        desc = "LSP range formatting",
      }
    end,
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<Space>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<Space>fg", "<cmd>FzfLua live_grep_native<cr>", desc = "Live grep" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    -- replace all Telescope keymaps with only one mapping
    keys = function()
      return {
        { "<Leader>t", ":Telescope<cr>", desc = "Telescope" },
      }
    end,
  },
}
