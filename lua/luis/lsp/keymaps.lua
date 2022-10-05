local M = {}

local whichkey = require "which-key"

local keymap = vim.api.nvim_set_keymap

local function keymappings(client, bufnr)
  local opts = { noremap = true, silent = true }

  keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  local keymap_l = {
    l = {
      name = "LSP",
      D = { "<cmd>lua require('luis.lsp').toggle_diagnostics()<CR>", "Toggle Inline Diagnostics" },
    }
  }

  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.F = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", "Format Document" }
    keymap_l.l.T = { "<cmd>lua require('luis.lsp.null-ls.formatters').toggle()<CR>", "Toggle Autoformat" }
  end

  local o = { buffer = bufnr, prefix = "<leader>" }
  whichkey.register(keymap_l, o)

end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
