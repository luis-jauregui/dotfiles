local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, lspsignature = pcall(require, "lsp_signature")
  if not ok then
      utils.error_plugin("lsp_signature")
      return
  end

  lspsignature.setup({
      bind         = true,
      hint_prefix  = "",
      hint_enable  = false,
      handler_opts = {
          border   = "rounded"
      }
  })

end

return M
