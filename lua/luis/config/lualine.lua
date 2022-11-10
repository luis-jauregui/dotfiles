local M = {}

function M.setup()

  local utils = require "luis.utils"
  local winbar = require "luis.config.winbar"

  local ok, lualine = pcall(require, "lualine")
  if not ok then
    utils.error_plugin("lualine")
    return
  end

  lualine.setup {

    options = {
      icons_enabled = true,
      theme = 'solarized_dark',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "alpha",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
        },
      },
      always_divide_middle = true,
      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          'diff',
        },
        {
          'filename',
          path = 0
        },
      },

      lualine_d = {
      },

      lualine_x = {
        {
          'diagnostics',
          symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
        },
        'filetype'
      },

      lualine_y = {},
      lualine_z = { "location" }
    },

    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
        }
      },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },

    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { winbar.get_winbar },
      -- lualine_x = { winbar.get_winbar },
      lualine_y = {},
      lualine_z = {},
    },

    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_d = {},
      lualine_y = {},
      lualine_z = {},
    },

    tabline = {},
    extensions = { "fugitive", "toggleterm", "nvim-tree" }
  }
end

return M
