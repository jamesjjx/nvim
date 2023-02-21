local telescope = require("telescope")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local function map(key, cmd, desc)
  vim.keymap.set("n", key, cmd, { noremap = true, desc = desc })
end

map("<leader>h", function()
  builtin.find_files({ cwd = utils.buffer_dir() })
end, "files in the working dir")
map("<leader>f", function()
  builtin.find_files({ find_command = { "rg", "--files", "--hidden" } })
end, "find files")
map("<leader>bf", function()
  builtin.buffers({ sort_lastused = true })
end, "open buffers")
