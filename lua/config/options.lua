-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.shiftwidth = 2
opt.softtabstop = 2
opt.swapfile = false

opt.splitright = false
opt.splitbelow = false

-- Disable format on save.
vim.g.autoformat = false

-- vim.g.python_recommended_style = 0
