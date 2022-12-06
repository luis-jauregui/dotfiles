local M = {}

local snippets_folder = vim.fn.stdpath "config" .. "/lua/luis/snippets/luasnips/"

local ls = require "luasnip"

function M.setup()
  ls.config.set_config {
    history              = true,
    updateevents         = "TextChanged,TextChangedI",
    enable_autosnippets  = false,
    store_selection_keys = "<C-q>",
  }

  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

  require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/luis/snippets/angular" } }
  -- require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/luis/snippets/typescript" } }

  vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]

  -- react snippets
  -- require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/luis/snippets/typescript" } }

  ls.filetype_extend("all", { "_" })
end

return M
