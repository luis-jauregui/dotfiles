local M = {}

local utils_s = require "luis.utils"
local ok, nls = pcall(require, "null-ls")

if not ok then
  utils_s.error_plugin("null-ls")
  return
end

local nls_utils = require "null-ls.utils"
local b = nls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "[eslint] #{m}\n[#{c}]",
    condition = function(utils)
      return utils.root_has_file({
        ".eslintrc.json"
        -- ".eslintrc.js",
      })
    end
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  with_root_file(b.formatting.prettierd, { ".prettierrc.json" }),
  with_diagnostics_code(b.diagnostics.eslint_d),
}

function M.setup(opts)
  nls.setup {
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
