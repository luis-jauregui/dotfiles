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
    keymap_l.l.F = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Document" }
    keymap_l.l.T = { "<cmd>lua require('luis.lsp.null-ls.formatters').toggle()<CR>", "Toggle Autoformat" }
  end

  local keymap_g = {
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    -- d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    b = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    -- b = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Goto Type Definition" },
  }

  local o = { buffer = bufnr, prefix = "<leader>" }
  whichkey.register(keymap_l, o)

  -- o = { buffer = bufnr, prefix = "g" }
  -- whichkey.register(keymap_g, o, false)
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
