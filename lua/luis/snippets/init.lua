local M = {}

local ls = require "luasnip"

function M.setup()
  ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,
    store_selection_keys = "<C-q>",
  }

  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/luis/snippets/angular" } }

  ls.filetype_extend("all", { "_" })
end

return M
