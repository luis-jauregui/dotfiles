local M = {}

local hop = require('hop')

function M.setup()

  local directions = require('hop.hint').HintDirection

  vim.keymap.set('', '<leader><leader>f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
  end, { remap = true })

  vim.keymap.set('', '<leader><leader>F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
  end, { remap=true })

  hop.setup {
    keys = 'etovxqpdygfblzhckisuran'
  }
end

return M
