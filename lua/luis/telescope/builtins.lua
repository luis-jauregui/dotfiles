local M = {}

function M.setup(reloader)

  if reloader == nil then
  else
    reloader()
  end

  local action_state = require("telescope.actions.state")
  local fb_actions = require("telescope").extensions.file_browser.actions
  local actions = require("telescope.actions")
  local themes = require("telescope.themes")

  local G = {}

  function G.grep_string()
    vim.ui.input({ prompt = "Grep for > " }, function(input)
      if input == nil then
        return
      end
      require("telescope.builtin").grep_string({ search = input })
    end)
  end

  function G.project_files()
    local opts = themes.get_dropdown {
      prompt_title = "~ Find Files in current project ~",
      previewer = false,
      layout_config = {
        height = 15,
      }
    }
    local ok = pcall(require("telescope.builtin").git_files, opts)
    if not ok then
      require("telescope.builtin").find_files(opts)
    end
  end

  function G.old_files()
    local opts = {
      prompt_title = "~ Recently used files ~",
      previewer = false,
      theme = "dropdown",
      layout_config = {
        height = 25,
      }
    }
    local ok = pcall(require("telescope.builtin").oldfiles, opts)
    if not ok then
      require("telescope.builtin").oldfiles(opts)
    end
  end

  function G.project_all()

    local opts = themes.get_dropdown {
      prompt_title = "~ Projects ~",
      hidden_files = true,
      layout_config = {
        height = 15,
      },

      base_dirs = {
        { path = '~/Documents/workspace' }
      },

      attach_mappings = function(prompt_bufnr, map)
        map("n", "b", false)
        return true
      end,
    }

    return require("telescope").extensions.project.project(opts)
  end


  function G.branches()
    require("telescope.builtin").git_branches({
      attach_mappings = function(_, map)
        map("i", "<c-j>", actions.git_create_branch)
        map("n", "<c-j>", actions.git_create_branch)
        return true
      end,
    })
  end

  function G.search_dotfiles()
    local opts = themes.get_dropdown {
      previewer = false,
      prompt_title = "~ Dotfiles ~",
      layout_config = {
        height = 15
      },
      cwd = "$HOME/AppData/Local/nvim",
      file_ignore_patterns = { "git" },
    }
    require("telescope.builtin").find_files(opts)
  end

  function G.grep_word()
    require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
  end

  function G.git_status()
    local opts = themes.get_dropdown {
      previewer = false,
      shorten_path = false,
      layout_config = {
        height = 15
      },
    }
    require("telescope.builtin").git_status(opts)
  end

  function G.select_tab()
    local opts = themes.get_dropdown {
      border = true,
      previewer = false,
      shorten_path = false,
      layout_config = {
        width = 80,
        height = 10,
      }
    }
    return require("telescope").extensions.tele_tabby.list(opts)
  end

  function G.find_symbol()
    vim.ui.input("Symbol for > ", function(input)
      if input == nil then
        return
      end
      require("telescope.builtin").lsp_workspace_symbols({ search = input })
    end)
  end

  function G.fd()
    local opts = themes.get_dropdown {
      cwd = "%:p:h",
      prompt_title = "~ Files in current directory ~",
      previewer = false,
      layout_config = {
        height = 15
      }
    }

    local ok = pcall(require("telescope.builtin").fd, opts)
  end

  function G.file_browser(opts)
    opts = opts or {}

    opts = {
      cwd = "%:p:h",
      prompt_title = "~ Files Browser ~",
      theme = "dropdown",
      path = opts.path,
      layout_config = {
        height = 25
      },

      attach_mappings = function(prompt_bufnr, map)
        local current_picker = action_state.get_current_picker(prompt_bufnr)

        local modify_cwd = function(new_cwd)
          local finder = current_picker.finder

          finder.path = new_cwd
          finder.files = true
          current_picker:refresh(false, { reset_prompt = true })
        end

        map("n", "-", function()
          modify_cwd(current_picker.cwd .. "/..")
        end)

        map("i", "~", function()
          modify_cwd(vim.fn.expand("~"))
        end)

        map("n", "yy", function()
          local entry = action_state.get_selected_entry()
          vim.fn.setreg("+", entry.value)
        end)

        map("i", "N", fb_actions.create)
        map("i", "D", fb_actions.remove)
        map("i", "R", fb_actions.rename)
        map("n", "h", fb_actions.goto_parent_dir)

        return true
      end,
    }

    return require("telescope").extensions.file_browser.file_browser(opts)
  end

  return setmetatable({}, {
  __index = function(_, k)

    if G[k] then
      return G[k]
    else
      return require("telescope.builtin")[k]
    end
  end,})

end

return M
