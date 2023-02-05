local telescope = require 'telescope'
telescope.load_extension 'fzf'

local builtin = require 'telescope.builtin'
local utils = require 'telescope.utils'

local function map(key, cmd)
  vim.keymap.set('n', key, cmd, { noremap = true })
end

map('<leader>h', function() builtin.find_files { cwd = utils.buffer_dir() } end)
map('<leader>b', function() builtin.buffers { sort_lastused = true } end)

