-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<Leader>w", ":w<cr>")

-- Switch tabs.
map("n", "<Left>", "<C-PageUp>")
map("n", "<Right>", "<C-PageDown>")
-- sort.
map("n", "<Leader>s", "vip:sort u<cr>")

-- Command-line mode.
map("c", "<C-A>", "<Home>")

map("n", "<leader>cn", ":cn<CR>")
map("n", "<leader>cp", ":cp<CR>")
map("n", "<leader>co", ":copen<CR>")
map("n", "<leader>cc", ":cclose<CR>")
