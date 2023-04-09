local builtin = require("statuscol.builtin")

require("statuscol").setup({
  relculright = true,
  segments = {
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
    { sign = { name = { "Signify" }, maxwidth = 1, colwidth = 1 } },
    {
      sign = { name = { ".*" }, maxwidth = 1, colwidth = 2 },
      click = "v:lua.ScSa",
    },
  },
})
