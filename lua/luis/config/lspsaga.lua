local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, saga = pcall(require, "lspsaga")

  if not ok then
      utils.error_plugin("lspsaga")
      return
  end

  saga.init_lsp_saga {

    server_filetype_map = {
      typescript = 'typescript'
    },

    finder_action_keys = {
      vsplit      = "<S-v>",
      split       = "<S-h>",
      tabe        = "<S-t>",
      quit        = "q",
      scroll_down = "<S-d>",
      scroll_up   = "<S-u>"
    },

    move_in_saga = {
      prev = '<S-Tab>', next = '<Tab>'
    }

  }

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  keymap('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  keymap('n', '<C-d>', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
  keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)

  keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

end

return M
