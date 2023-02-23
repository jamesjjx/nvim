local M = {}

M.setup = function()
  require("nord").setup({
    on_highlights = function(highlights, c)
      -- Show syntax error as normal texts
      highlights["@error"] = { fg = c.snow_storm.origin }
    end,
  })
end

return M
