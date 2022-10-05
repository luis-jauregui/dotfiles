local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, lspkind = pcall(require, "lspkind")
  if not ok then
      utils.error_plugin("lspkind")
      return
  end

  lspkind.init({
    mode   = 'symbol_text',
    preset = 'codicons',

    symbol_map = {
        Text          = "",
        Method        = "",
        Function      = "",
        Constructor   = "",
        Field         = "ﰠ",
        Variable      = "",
        Class         = "ﴯ",
        Interface     = "",
        Module        = "",
        Property      = "ﰠ",
        Unit          = "",
        Value         = "",
        Enum          = "",
        Keyword       = "",
        Snippet       = "",
        Color         = "",
        File          = "",
        Reference     = "",
        Folder        = "",
        EnumMember    = "",
        Constant      = "",
        Struct        = "פּ",
        Event         = "",
        Operator      = "",
        TypeParameter = ""
    },
  })

end

return M
