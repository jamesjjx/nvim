local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "lukas-reineke/indent-blankline.nvim",
  {
    "gbprod/nord.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("configs.nord").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.lualine")
    end,
  },
  "christoomey/vim-tmux-navigator",
  "vim-scripts/file-line",
  --Plug 'roxma/vim-paste-easy'
  {
    "mhinz/vim-signify",
    config = function()
      require("configs.signify")
    end,
  },
  --Plug 'vim-scripts/argtextobj.vim'
  --"Plug 'SirVer/ultisnips'
  "jlanzarotta/bufexplorer",
  --"Plug 'dag/vim-fish'
  --Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  --Plug 'junegunn/fzf.vim'
  --Plug 'tpope/vim-obsession'
  --if has('nvim')
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.telescope")
    end,
  },
  --  " Languages are specified in `nvim-treesitter.configs`.
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("configs.treesitter")
    end,
  },
  {
    "nvim-treesitter/playground",
    -- lazy-load on a command
    cmd = "TSPlaygroundToggle",
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      vim.keymap.set("i", "<C-j>", function()
        require("luasnip").expand_or_jump()
      end)
      vim.keymap.set("s", "<C-j>", function()
        require("luasnip").jump(1)
      end)
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        require("luasnip").jump(-1)
      end)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- 'hrsh7th/vim-vsnip',
      "onsails/lspkind.nvim",
      -- sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      -- 'hrsh7th/cmp-vsnip',
      "hrsh7th/cmp-nvim-lsp-signature-help",
      --"L3MON4D3/LuaSnip",
    },
    config = function()
      require("configs.cmp")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.trouble")
    end,
  },
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
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = false,
          },
        },
        messages = {
          view_search = false,
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.lsp.null_ls")
    end,
  },
  {
    "folke/neodev.nvim",
  },
}

require("lazy").setup(plugins, {
  ui = { border = "rounded" },
})
