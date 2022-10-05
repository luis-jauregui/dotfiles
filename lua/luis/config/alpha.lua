local M = {}

function M.setup()

  local utils = require "luis.utils"

  local ok, alpha = pcall(require, "alpha")
  if not ok then
      utils.error_plugin("alpha")
      return
  end

  local dashboard = require "alpha.themes.dashboard"

  local function header()
      return {
        [[░██████╗░░█████╗░██████╗░██╗██╗░░░░░░█████╗░  ██████╗░███████╗  ███╗░░░███╗░█████╗░███╗░░██╗░█████╗░]],
        [[██╔════╝░██╔══██╗██╔══██╗██║██║░░░░░██╔══██╗  ██╔══██╗██╔════╝  ████╗░████║██╔══██╗████╗░██║██╔══██╗]],
        [[██║░░██╗░██║░░██║██████╔╝██║██║░░░░░███████║  ██║░░██║█████╗░░  ██╔████╔██║██║░░██║██╔██╗██║██║░░██║]],
        [[██║░░╚██╗██║░░██║██╔══██╗██║██║░░░░░██╔══██║  ██║░░██║██╔══╝░░  ██║╚██╔╝██║██║░░██║██║╚████║██║░░██║]],
        [[╚██████╔╝╚█████╔╝██║░░██║██║███████╗██║░░██║  ██████╔╝███████╗  ██║░╚═╝░██║╚█████╔╝██║░╚███║╚█████╔╝]],
        [[░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝╚═╝░░╚═╝  ╚═════╝░╚══════╝  ╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚══╝░╚════╝░]],
      }
  end

  dashboard.section.header.val = header()

  dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":lua require('luis.telescope.builtins').setup().project_files()<CR>"),
      dashboard.button("p", "  Find project", ":lua require('luis.telescope.builtins').setup().project_all()<CR>"),
      dashboard.button("r", "  Recently used files", ":lua require('luis.telescope.builtins').setup().old_files()<CR>"),
      dashboard.button("t", "  Find text", ":lua require('luis.telescope.builtins').setup().grep_string()<CR>"),
      dashboard.button("d", "  Dotfiles", ":lua require('luis.telescope.builtins').setup().search_dotfiles()<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  local function footer()
      -- Number of plugins
      local total_plugins = #vim.tbl_keys(packer_plugins)
      local datetime = os.date "%d-%m-%Y %H:%M:%S"
      local plugins_text =
      "   "
          .. total_plugins
          .. " plugins"
          .. "   v"
          .. vim.version().major
          .. "."
          .. vim.version().minor
          .. "."
          .. vim.version().patch
          .. "   "
          .. datetime

      -- Quote
      -- local fortune = require "alpha.fortune"
      -- local quote = table.concat(fortune(), "\n")

      return plugins_text .. "\n" .. "Hazlo por tu familia y amigos, que no son para toda la vida."
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M
