local M = {}

SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
    RELOAD("plenary")
    RELOAD("telescope")
  end
end

function M.setup()
  reloader()
  require("luis.telescope.setup").setup(reloader)
  reloader()
  require("luis.telescope.builtins").setup(reloader)
  reloader()
  require("luis.telescope.mappings").setup(reloader)
end

return M
