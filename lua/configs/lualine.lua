local function setup()
  require("lualine").setup({
    options = {
      theme = "nord",
      icons_enabled = false,
    },
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = true,
          newfile_status = true,
          path = 1,
        },
      },
    },
    inactive_sections = {
      lualine_c = {
        {
          "filename",
          file_status = true,
          newfile_status = true,
          path = 1,
        },
      },
    },
  })
end

--local group = vim.api.nvim_create_augroup("lualine_group", { clear = true })
--vim.api.nvim_create_autocmd({ "ColorScheme" }, { callback = function() setup() end,  group = group, })
setup()
