local M = {}

local utils = require "luis.utils"

local ok, whichkey = pcall(require, "which-key")
if not ok then
  utils.error_plugin("whichkey")
  return
end

local conf = {
  window = {
    border   = "single",
    position = "bottom",
  },
}

whichkey.setup(conf)

local opts = {
  mode    = "n", -- Normal mode
  prefix  = "<leader>",
  buffer  = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent  = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait  = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
  local keymaps = {

    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    a = {
      name = "Angular",
      c = { [[ <Esc><Cmd>lua require('luis.utils.term').component()<CR>]], "Create component" },
      m = { [[ <Esc><Cmd>lua require('luis.utils.term').module()<CR>]], "Create module" },
      s = { [[ <Esc><Cmd>lua require('luis.utils.term').service()<CR>]], "Create service" },
      t = { [[ <Esc><Cmd>lua require('luis.utils.term').tree()<CR>]], "Project structure" },
    },

    h = {
      name = "Help",
      c = { [[ <Esc><Cmd>lua require('luis.utils.cht').cht_input()<CR>]], "Code" },
      s = { [[ <Esc><Cmd>lua require('luis.utils.term').so()<CR>]], "Stack Overflow" },
      -- x = { "<cmd>lua require('luis.utils.term').project_info_toggle()<CR>", "Project Info" },
      k = { "<cmd>lua require('luis.utils.term').system_info_toggle()<CR>", "System Info" },
      -- g = { "<cmd>lua require('luis.utils.term').git_commit_toggle()<CR>", "Conventional Commit" },
    },

    b = {
      name = "Buffer",
      h = { "<cmd>BDelete hidden<CR>", "Close Hidden Buffers" },
      t = { "<cmd>BDelete! this<CR>", "Force Close Buffer" },
      n = { "<cmd>BDelete nameless<CR>", "Close Buffers Without Name" },
    },

    p = {
      name = "Packer",
      i = { "<cmd>PackerInstall<CR>", "Install" },
      c = { "<cmd>PackerClean<CR>", "Clean" },
      s = { "<cmd>PackerStatus<CR>", "Status" },
      y = { "<cmd>PackerSync<CR>", "Sync" },
    },

    g = {
      name = "Git",
      l = { "<cmd>lua require('luis.utils.term').git_client_toggle()<CR>", "Git TUI" },
      h = { "<cmd>Gitsigns preview_hunk<CR>", "Gitsigns - Preview Hunk" }
    },

    f = {
      name = "Find",
      a = { "<cmd>lua require('luis.telescope.builtins').setup().project_files()<CR>", "Find file" },
      b = { "<cmd>lua require('luis.telescope.builtins').setup().project_all()<CR>", "Find project" },
      c = { "<cmd>lua require('luis.telescope.builtins').setup().search_dotfiles()<CR>", "Find dotfile" }
    }
  }

  whichkey.register(keymaps, opts)
end


function M.setup()
  normal_keymap()
end

return M
