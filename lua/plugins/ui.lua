return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "Function", "Label" },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        view_search = false,
      },
      -- you can enable a preset for easier configuration
      presets = {
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      lsp = {
        message = {
          enabled = false,
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          Error = "●",
          Warn = "●",
          Hint = "●",
          Info = "●",
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "nord",
        icons_enabled = false,
        globalstatus = false,
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
        lualine_z = {},
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
    },
  },
}
