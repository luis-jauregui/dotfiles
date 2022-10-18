local M = {}

local home = os.getenv('LOCALAPPDATA')
local path = home .. '\\nvim-data\\mason\\packages\\angular-language-server'
local cmd = { "node", path .. "\\node_modules\\@angular\\language-server\\index.js", "--stdio", "--tsProbeLocations",
  path, "--ngProbeLocations", path }

local servers = {
  emmet_ls = {
    filetypes = { "html" }
  },
  html = {},
  jsonls = {},
  tsserver = { disable_formatting = true },
  angularls = {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = cmd
    end
  },
  cssls = {},
  sumneko_lua = {
    settings = {
      Lua = {

        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";")
        },

        diagnostics = {
          globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
        },

        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          maxPreload = 2000,
          preloadFileSize = 50000
        },

        completion = { callSnippet = "Both" },
        telemetry = { enable = false }

      }
    }
  }
}

function M.on_attach(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  require('luis.lsp.keymaps').setup(client, bufnr)
  require('luis.lsp.null-ls.formatters').setup(client, bufnr)


  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end

  -- navic
  if client.server_capabilities.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities) -- for nvim-cmp

local opts = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}


require("luis.lsp.handlers").setup()

function M.setup()

  require("luis.lsp.null-ls").setup(opts)

  require("luis.lsp.installer").setup(servers, opts)

end

local diagnostics_active = true

local utils = require "luis.utils"

function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
    utils.info("Enabled diagnostics", "Diagnostic")
  else
    vim.diagnostic.hide()
    utils.warn("Disabled diagnostics", "Diagnostic")
  end
end

return M
