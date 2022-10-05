local M = {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local action_layout = require("telescope.actions.layout")

local set_prompt_to_entry_value = function(prompt_bufnr)
	local entry = action_state.get_selected_entry()
	if not entry or not type(entry) == "table" then
		return
	end
	action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

function M.setup(reloader)

  reloader()

  require("telescope").setup({

    defaults = {

      file_ignore_patterns = { "node_modules" },

      prompt_prefix = "❯ ",
      selection_caret = "❯ ",

      winblend = 0,

      selection_strategy = "reset",
      sorting_strategy = "descending",
      scroll_strategy = "cycle",
      color_devicons = true,

      mappings = {

        i = {
          ["<TAB>"] = actions.move_selection_next,
          ["<S-TAB>"] = actions.move_selection_previous,
          ["<C-y>"] = set_prompt_to_entry_value,
          ["<C-p>"] = action_layout.toggle_preview,
          ["<S-h>"] = actions.file_split,
          ["<S-v>"] = actions.file_vsplit,
          ["<S-t>"] = actions.select_tab,
        },

        n = {
          ["q"] = actions.close,
          ["<TAB>"] = actions.move_selection_next,
          ["<S-TAB>"] = actions.move_selection_previous,
          ["<C-p>"] = action_layout.toggle_preview,
          ["<S-h>"] = actions.file_split,
          ["<S-v>"] = actions.file_vsplit,
          ["<S-t>"] = actions.select_tab,
        },

      },

      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    },

    pickers = {

      fd = {
        theme = "dropdown",
        previewer = false,
      },

      git_branches = {
        mappings = {
          i = {
            ["<C-a>"] = false,
          },
        },
      },
    },
  })

  _ = require("telescope").load_extension("file_browser")
  _ = require("telescope").load_extension("project")
  _ = require("telescope").load_extension("tele_tabby")
  -- _ = require("telescope").load_extension("projects")
end

return M
