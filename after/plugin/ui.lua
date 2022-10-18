local utils = require "luis.utils"

local ok, dressing = pcall(require, "dressing")
if not ok then
  utils.error_plugin("dressing")
end

dressing.setup({
  input = {
    relative = "editor",
    winblend = 100,
    mappings = {
      n = {
        ["q"]    = "Close",
        ["<CR>"] = "Confirm",
      },
    },
  }
})
