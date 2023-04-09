vim.opt.updatetime = 400
-- vim.g.signify_number_highlight = 1
vim.g.signify_sign_show_count = false
vim.g.signify_sign_add = "┃"
vim.g.signify_sign_delete = "▁"
vim.g.signify_sign_delete_first_line = "▔"
vim.g.signify_sign_change = "┃"
vim.g.signify_sign_change_delete = "┃"

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "SignifySignAdd", { fg = "#a3be8c" })
    vim.api.nvim_set_hl(0, "SignifySignChange", { fg = "#ebcb8b" })
    vim.api.nvim_set_hl(0, "SignifySignDelete", { fg = "#bf616a" })
  end,
})
