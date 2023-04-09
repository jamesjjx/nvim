local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local old_fn = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return old_fn(contents, syntax, opts, ...)
end

vim.diagnostic.config({
  virtual_text = false
})

for _, v in ipairs({'Error', 'Warn', 'Info', 'Hint'}) do
  local type = "DiagnosticSign" .. v
  vim.fn.sign_define(type, { text = "●", texthl = type, linehl = "", numhl = "" })
end

require("lspconfig.ui.windows").default_options.border = "single"
