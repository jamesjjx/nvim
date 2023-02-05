vim.g.nord_borders = true

local settings = require 'settings'

if settings.theme ~= 'nord' then
  return
end

-- Load the colorscheme, and customize some colors.
require 'nord'.set()

local nord = require 'nord.colors'
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = nord.nord2_gui })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = nord.nord9_gui, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = nord.nord9_gui })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = nord.nord3_gui_bright })
for key, value in pairs({
	CmpItemKindClass = 'CmpItemKindStruct',
	CmpItemKindColor = 'Label',
	CmpItemKindConstant = 'Constant',
	CmpItemKindConstructor = 'CmpItemKindMethod',
	CmpItemKind = 'Type',
	CmpItemKindEnum = 'CmpItemKindStruct',
	CmpItemKindEnumMember = 'CmpItemKindConstant',
	CmpItemKindEvent = 'Repeat',
	CmpItemKindField = 'Identifier',
	CmpItemKindFile = 'Directory',
	CmpItemKindFolder = 'CmpItemKindFile',
	CmpItemKindFunction = 'Function',
	CmpItemKindInterface = 'Type',
	CmpItemKindKeyword = 'Keyword',
	CmpItemKindMethod = 'CmpItemKindFunction',
	CmpItemKindModule = 'Include',
	CmpItemKindOperator = 'Operator',
	CmpItemKindProperty = 'CmpItemKindField',
	CmpItemKindReference = 'StorageClass',
	CmpItemKindSnippet = 'Special',
	CmpItemKindStruct = 'Structure',
	CmpItemKindText = 'String',
	CmpItemKindTypeParameter = 'Typedef',
	CmpItemKindUnit = 'CmpItemKindStruct',
	CmpItemKindValue = 'CmpItemKindConstant',
	CmpItemKindVariable = 'Identifier',

}) do
  vim.cmd(string.format('hi link %s %s',  key, value))
end

vim.cmd 'hi link LspInfoBorder FloatBorder'
