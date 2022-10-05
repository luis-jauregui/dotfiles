local M = {}


function M.setup()

  local utils = require "luis.utils"

  local ok, treesitter = pcall(require, "nvim-treesitter")
  if not ok then
    utils.error_plugin("tressitter")
    return
  end

  require("nvim-treesitter.configs").setup {

    ensure_installed = { "vim", "css", "html", "javascript", "lua", "typescript", "tsx", "json", "markdown" },

    autotag = {
      enable = true
    },

    highlight = {
      enable = true,
      disable = {},
    },

    matchup = {
      enable = true
    },

    context_commentstring = {
      enable = true,
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s'
        }
      }
    },

    indent = {
      enable = true,
      -- disable = { "html" }
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    refactor = {
      highlight_definitions = { enable = true },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "gr",
        },
      },
    },

    textobjects = {

      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        }
      }
    },

    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  }
end

return M
