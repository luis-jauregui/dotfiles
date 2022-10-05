local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, bufferline = pcall(require, "bufferline")
  if not ok then
      utils.error_plugin("bufferline")
      return
  end

  bufferline.setup({

    options = {

      custom_filter = function (buf_number, buf_numbers)
        local tab_num = 0

        for _ in pairs(vim.api.nvim_list_tabpages()) do
          tab_num = tab_num + 1
        end

        if tab_num > 1 then
          if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
            return true
          end
        else
          return true
        end
      end,

      offsets = {
        filetype = "NvimTree",
      },

      mode                    = "tabs",
      separator_style         = "slant" or "padded_slant",
      always_show_bufferline  = false,
      show_buffer_close_icons = false,
      show_close_icon         = false,
      color_icons             = true,
      diagnostics             = "nvim_lsp",

      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,

    },

    highlights = {

      separator = {
        fg = '#073642',
        bg = '#002b36',
      },

      separator_selected = {
        fg = '#073642',
      },

      background = {
        fg = '#657b83',
        bg = '#002b36'
      },

      buffer_selected = {
        fg = '#fdf6e3',
        bold = true,
      },

      fill = {
        bg = '#073642'
      }

    },
  })

  vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
  vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
end

return M
