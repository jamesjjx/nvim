local telescope = require("telescope")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local function map(key, cmd, desc)
  vim.keymap.set("n", key, cmd, { noremap = true, desc = desc })
end

map("<Leader>t", ":Telescope<cr>")

map("<leader>fh", function()
  builtin.find_files({ cwd = utils.buffer_dir() })
end, "files in the working dir")

map("<leader>ff", function()
  builtin.find_files({ find_command = { "rg", "--files", "--hidden" } })
end, "telescope.builtin.find_files")

map("<leader>fb", function()
  builtin.buffers({ sort_lastused = true })
end, "telescope.builtin.buffers")

map("<leader>fg", function()
  builtin.live_grep()
end, "telescope.builtin.live_grep")

map("<leader>fr", function()
  builtin.resume()
end, "telescope.builtin.resume")
