local use_telescope = true
local set_key = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
end
local opts = { noremap = true, silent = true }
if use_telescope then
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions show_line=false<CR>", opts)
  vim.keymap.set("n", "g0", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations show_line=false<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references show_line=false<CR>", opts)
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions show_line=false<CR>", opts)
else
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
end
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

set_key("n", "<leader>l", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  vim.lsp.buf.format({
    range = { ["start"] = { line, 0 }, ["end"] = { line, 1000 } },
  })
end, "LSP line formatting")
set_key("x", "gl", "<cmd>lua vim.lsp.buf.format()<CR><ESC>", "LSP range formatting")
