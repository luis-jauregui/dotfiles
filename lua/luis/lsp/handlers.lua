local M = {}

function M.setup()

  local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  }

  for type, sign in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = sign, texthl = hl, numhl = "" })
  end

  -- LSP handlers configuration
  local lsp = {

    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },

    publishDiagnostics = {
      underline = false,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●"},
      severity_sort = true,
    },

    diagnostic = {

      signs = {
        active = signs,
      },

      virtual_text = {
        prefix = '●',
      },

      update_in_insert = false,
      underline = false,

      float = {
        source = "always", -- Or "if_many"
        border = "rounded",
        header = "",
        prefix = ""
      },
    },

  }

  -- Diagnostic configuration
  vim.diagnostic.config(lsp.diagnostic)

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, lsp.publishDiagnostics)

  -- Hover configuration
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)

  -- Signature help configuration
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end

return M
