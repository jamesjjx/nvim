return {
  {
    "gbprod/nord.nvim",
    opts = {
      on_highlights = function(highlights, c)
        -- Show syntax error as normal texts
        highlights["@error"] = { fg = c.snow_storm.origin }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
