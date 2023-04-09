local opt = vim.opt
local g = vim.g
local fn = vim.fn

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
g.python_recommended_style = 0
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.backup = false
opt.swapfile = false
opt.undofile = true
-- Set filename (instead of full path) as the tab filename
opt.guitablabel = "%t%m"
opt.nu = true
opt.rnu = true
opt.mouse = "a"
-- Keep at least so many lines on the top or on the bottom.
opt.scrolloff = 5
opt.termguicolors = true

local group = vim.api.nvim_create_augroup("cursor_line_in_active_window", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  command = "setlocal cursorline",
  group = group,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  command = "setlocal nocursorline",
  group = group,
})

-- Automaitcally disable highlight.
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace("auto_hlsearch"))

-- mappings
local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }
map("n", "<Leader>w", ":w<cr>")
map("n", "j", "gj")
map("n", "k", "gk")
-- Switch tabs.
map("n", "<Left>", "<C-PageUp>")
map("n", "<Right>", "<C-PageDown>")
-- sort.
map("n", "<Leader>s", "vip:sort u<cr>")

-- Command-line mode.
map("c", "<C-A>", "<Home>")

--" Delete the enclosing () or {}.
--nmap <Leader>d( di(v%p
--nmap <Leader>d{ di{v%p
--nmap <Leader>be :BufExplorer<cr>
--
map("n", "<leader>cn", ":cn<CR>")
map("n", "<leader>cp", ":cp<CR>")
map("n", "<leader>co", ":copen<CR>")
map("n", "<leader>cc", ":cclose<CR>")
