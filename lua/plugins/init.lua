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
  'lukas-reineke/indent-blankline.nvim',
  {
    'gbprod/nord.nvim',
    priority = 1000,
    lazy = false,
  },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
      config = function() require 'configs.lualine' end,
    },
    'christoomey/vim-tmux-navigator',
    'vim-scripts/file-line',
    --Plug 'roxma/vim-paste-easy'
    {
      'mhinz/vim-signify',
      config = function() require 'configs.signify' end,
    },
    --Plug 'vim-scripts/argtextobj.vim'
    --"Plug 'SirVer/ultisnips'
    'jlanzarotta/bufexplorer',
    --"Plug 'dag/vim-fish'
    --Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
    --Plug 'junegunn/fzf.vim'
    --Plug 'tpope/vim-obsession'
    --if has('nvim')
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function() require 'configs.telescope' end,
    },
    --  " Languages are specified in `nvim-treesitter.configs`.
    {
      'nvim-treesitter/nvim-treesitter',
      build = function()
        require 'nvim-treesitter.install'.update({ with_sync = true })
      end,
      config = function() require 'configs.treesitter' end,
    },
  {
    'nvim-treesitter/playground',
    -- lazy-load on a command
    cmd = "TSPlaygroundToggle",
  },
    {
      "L3MON4D3/LuaSnip",
      config = function()
        vim.keymap.set('i', '<C-j>', function() require 'luasnip'.expand_or_jump() end)
        vim.keymap.set('s', '<C-j>', function() require 'luasnip'.jump(1) end)
        vim.keymap.set({'i', 's'}, '<C-k>', function() require 'luasnip'.jump(-1) end)
      end,
    },
    {
      'hrsh7th/nvim-cmp',
      event = "InsertEnter",
      dependencies = {
        -- 'hrsh7th/vim-vsnip',
        'onsails/lspkind.nvim',
        -- sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        -- "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        -- 'hrsh7th/cmp-vsnip',
        "hrsh7th/cmp-nvim-lsp-signature-help",
        --"L3MON4D3/LuaSnip",
      },
      config = function() require 'configs.cmp' end,
    },
    'neovim/nvim-lspconfig',
    {
      'folke/trouble.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
      config = function() require 'configs.trouble' end,
    },
    {
      'ojroques/nvim-osc52',
      config = function()
        local copy = function ()
          if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
            require 'osc52'.copy_register '+'
          end
        end
        vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
      end,
    },
  {
    'dstein64/vim-startuptime',
    -- lazy-load on a command
    cmd = "StartupTime",
  },
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {    "williamboman/mason.nvim",
    config = function()
      require 'mason'.setup({
        ui = { border = 'rounded' },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require 'mason-lspconfig'.setup({
        ensure_installed = { 'sumneko_lua' },
        automatic_installation = true,
      })
    end,
  }
}

require('lazy').setup(plugins, {
  ui = { border = 'rounded' }
})
