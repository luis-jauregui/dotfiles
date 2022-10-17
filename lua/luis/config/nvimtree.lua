local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, tree = pcall(require, "nvim-tree")
  if not ok then
    utils.error_plugin("nvim-tree")
    return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
    return
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  tree.setup {

    disable_netrw = true,
    hijack_netrw = true,

    update_focused_file = {
      enable     = true,
      update_cwd = true,
    },

    renderer = {

      root_folder_modifier = ":t",

      icons = {
        glyphs = {

          default = "",
          symlink = "",

          folder = {
            arrow_open   = "",
            arrow_closed = "",
            default      = "",
            open         = "",
            empty        = "",
            empty_open   = "",
            symlink      = "",
            symlink_open = "",
          },
          git = {
            unstaged  = "",
            staged    = "S",
            unmerged  = "",
            renamed   = "➜",
            untracked = "U",
            deleted   = "",
            ignored   = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint    = "",
        info    = "",
        warning = "",
        error   = "",
      },
    },
    view = {
      adaptive_size = true,
      -- width  = 30,
      -- height = 30,
      side   = "right",
      mappings = {
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "<S-n>", cb = tree_cb "create" },
          { key = "<S-r>", cb = tree_cb "rename" },
          { key = "<S-h>", cb = tree_cb "split" },
          { key = "<S-v>", cb = tree_cb "vsplit" },
          { key = "<S-t>", cb = tree_cb "tabnew" },
          { key = "?", cb = tree_cb "toggle_help" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "<Tab>", action = "" },
          { key = "s", action = "" },
          { key = "s", action = "" },
        },
      },
    },
  }

end

return M
