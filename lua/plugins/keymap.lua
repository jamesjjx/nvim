-- Keymap configs for various plugins.
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
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = {
        ["<C-p>"] = function(_)
          if cmp.visible() then
            cmp.complete({ behavior = cmp.SelectBehavior.Select })
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          end
        end,
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",

    init = function()
      -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>cl", false }
    end,
  },
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>l",
        function()
          local line = vim.api.nvim_win_get_cursor(0)[1]
          require("conform").format({
            range = { ["start"] = { line, 0 }, ["end"] = { line, 1000 } },
            lsp_fallback = true,
          })
        end,
        desc = "line formatting",
      },
      {
        "gl",
        function()
          require("conform").format({ lsp_fallback = true })
        end,
        desc = "Format buffer or selected reange",
        mode = { "n", "x" },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<Space>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<Space>fg", "<cmd>FzfLua live_grep_native<cr>", desc = "Live grep" },
      { "<Space>fb", "<cmd>FzfLua buffers<cr>", desc = "Live grep" },
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
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
}
