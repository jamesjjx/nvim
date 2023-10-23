return {
  {
    "gbprod/nord.nvim",
    opts = {
      on_highlights = function(highlights, c)
        -- Show syntax error as normal texts
        highlights["@error"] = { fg = c.snow_storm.origin }

        -- FzfLua
        -- e.g. when grepping, it will say "<ctrl-g> to Fuzzy Search".
        -- ctrl-g is header_bind, "Fuzzy Search" is header_text
        --highlights["FzfLuaHeaderBind"] = {
        highlights["FzfLuaHeaderText"] = { fg = c.snow_storm.origin }
        --highlights["FzfLuaHeaderText"] = {
        -- text (normal vs current line)
        highlights["FzfLuaFg"] = { fg = c.snow_storm.origin }
        highlights["FzfLuaBg"] = { bg = c.polar_night.origin }
        highlights["FzfLuaFgPlus"] = { fg = c.snow_storm.brighter }
        highlights["FzfLuaBgPlus"] = { bg = c.polar_night.brighter }
        -- highlighted substr (normal vs current line)
        highlights["FzfLuaHl"] = { fg = c.frost.ice }
        highlights["FzfLuaHlPlus"] = { fg = c.frost.ice }
        -- matching counters
        highlights["FzfLuaInfo"] = { fg = c.aurora.yellow }
        highlights["FzfLuaPointer"] = { fg = c.aurora.purple }
        highlights["FzfLuaPrompt"] = { fg = c.frost.water }
        highlights["FzfLuaMarker"] = { fg = "#a3be8b" }
        highlights["FzfLuaSpinner"] = { fg = "#b48dac" }
        highlights["FzfLuaHeader"] = { fg = c.snow_storm.brighter }
        highlights["FzfLuaCutter"] = { bg = c.polar_night.origin }
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
