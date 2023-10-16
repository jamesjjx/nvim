return {
  "christoomey/vim-tmux-navigator",
  "wsdjeg/vim-fetch",
  {
    "ojroques/nvim-osc52",
    config = function()
      local copy = function()
        if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
          require("osc52").copy_register("+")
        end
      end
      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
  },
  {
    "projekt0n/circles.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      "telescope",
    },
  },
  {
    "otavioschwanck/telescope-alternate.nvim",
    config = function()
      require("telescope-alternate").setup({
        mappings = {
          {
            "(.*)/(.*).cc$",
            {
              { "[1]/[2].h", "header" },
              { "[1]/[2]_test.cc", "test" },
            },
          },
          {
            "(.*)/(.*).h$",
            {
              { "[1]/[2].cc", "cc" },
              { "[1]/[2]_test.cc", "test" },
            },
          },
          {
            "(.*)/(.*)_test.cc$",
            {
              { "[1]/[2].cc", "cc" },
              { "[1]/[2].h", "header" },
            },
          },
        },
      })
      vim.keymap.set("n", "<leader>fa", ":Telescope telescope-alternate alternate_file<cr>")
      require("telescope").load_extension("telescope-alternate")
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "luukvbaal/statuscol.nvim",
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        relculright = true,
        segments = {
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          { sign = { name = { "Signify" }, maxwidth = 1, colwidth = 1 } },
          {
            sign = { name = { ".*" }, maxwidth = 1, colwidth = 2 },
            click = "v:lua.ScSa",
          },
        },
      }
    end,
  },
  {
    "mhinz/vim-signify",
    config = function()
      vim.opt.updatetime = 400
      -- vim.g.signify_number_highlight = 1
      vim.g.signify_sign_show_count = false
      vim.g.signify_sign_add = "┃"
      vim.g.signify_sign_delete = "▁"
      vim.g.signify_sign_delete_first_line = "▔"
      vim.g.signify_sign_change = "┃"
      vim.g.signify_sign_change_delete = "┃"

      local function reset_colors()
        vim.api.nvim_set_hl(0, "SignifySignAdd", { fg = "#a3be8c" })
        vim.api.nvim_set_hl(0, "SignifySignChange", { fg = "#ebcb8b" })
        vim.api.nvim_set_hl(0, "SignifySignDelete", { fg = "#bf616a" })
      end

      -- It's unclear whether colorscheme is set before or after. The most robust
      -- way seems to be to call reset_colors now, and whenever colorscheme is
      -- changed in the future.
      reset_colors()
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = "*",
        callback = reset_colors,
      })
    end,
  },
}
