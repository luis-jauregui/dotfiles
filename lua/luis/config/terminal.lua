local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, terminal = pcall(require, "toggleterm")
  if not ok then
      utils.error_plugin("toggleterm")
      return
  end

  terminal.setup {
    size            = 15,
    hide_numbers    = true,
    open_mapping    = [[<C-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor  = 0.3,
    start_in_insert = true,
    persist_size    = true,
    direction       = "horizontal",
    shell           = "pwsh.exe -nologo"
  }

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-j>', [[<C-\><C-n>]], opts)
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  -- vim.api.nvim_command [[command! -count=1 Live lua require'toggleterm'.exec("live-server",    <count>, 12)]]
  -- vim.api.nvim_command [[command! -count=1 Run lua require'toggleterm'.exec("yarn dev",    <count>, 12)]]
  -- vim.api.nvim_command [[command! -count=1 Ng lua require'toggleterm'.exec("ng serve -o",    <count>, 12)]]
end

return M
