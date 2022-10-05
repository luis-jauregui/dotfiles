local M = {}
local Terminal = require("toggleterm.terminal").Terminal

local git_tui = "lazygit"
local tokei = "tokei"
local bottom = "btm"
local git_cz = "git cz"

------------------ Git cz ----------------------------

-- local git_commit = Terminal:new {
--   cmd = git_cz,
--   dir = "git_dir",
--   hidden = true,
--   direction = "float",
--   float_opts = {
--     border = "double",
--   },
-- }
--
-- function M.git_commit_toggle()
--   git_commit:toggle()
-- end

------------------ Bottom ----------------------------

local system_info = Terminal:new {
  cmd = bottom,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = true,
}

function M.system_info_toggle()
  system_info:toggle()
end

------------------ Tokei ----------------------------

-- local project_info = Terminal:new {
--   cmd = tokei,
--   dir = "git_dir",
--   hidden = true,
--   direction = "float",
--   float_opts = {
--     border = "double",
--   },
--   close_on_exit = false,
-- }
--
-- function M.project_info_toggle()
--   project_info:toggle()
-- end

------------------ Git ----------------------------

local git_client = Terminal:new {
  cmd = git_tui,
  hidden = true,
  direction = "float",
  float_opts = {
    border = "curved",
    width = 100,
    height = 25,
  },
}

function M.git_client_toggle()
  git_client:toggle()
end

------------------ Terminal ----------------------------

local function default_on_open(term)
  vim.cmd "stopinsert"
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
end

function M.open_term(cmd, opts)

  opts = opts or {}
  opts.size = opts.size or vim.o.columns * 0.5
  opts.direction = opts.direction or "vertical"
  opts.on_open = opts.on_open or default_on_open
  opts.on_exit = opts.on_exit or nil

  local new_term = Terminal:new {
    cmd = cmd,
    dir = "git_dir",
    auto_scroll = false,
    close_on_exit = false,
    start_in_insert = false,
    on_open = opts.on_open,
    on_exit = opts.on_exit,
    direction = "float",
    float_opts = {
      border = "curved",
      width = 120,
      height = 30,
      windblend = 0
    },
  }
  new_term:open(opts.size, opts.direction)
end

function M.open_term_angular(cmd, opts)

  opts = opts or {}
  opts.size = opts.size or vim.o.columns * 0.5
  opts.direction = opts.direction or "vertical"
  opts.on_open = opts.on_open or default_on_open
  opts.on_exit = opts.on_exit or nil


  local new_term = Terminal:new {
    cmd = cmd,
    dir = "git_dir",
    auto_scroll = false,
    close_on_exit = opts.close_on_exit,
    start_in_insert = true,
    on_open = opts.on_open,
    on_exit = opts.on_exit,
    direction = "float",
    float_opts = {
      border = "curved",
      width = 80,
      height = 20,
      windblend = 0
    },
  }
  new_term:open(opts.size, opts.direction)
end

------------------ Cheatsheet ----------------------------

local lang = ""
local file_type = ""
local function cht_on_open(term)
  vim.cmd "stopinsert"
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_name(term.bufnr, "cheatsheet-" .. term.bufnr)
  vim.api.nvim_buf_set_option(term.bufnr, "filetype", "cheat")
  vim.api.nvim_buf_set_option(term.bufnr, "syntax", lang)
end

local function cht_on_exit(_)
  vim.cmd [[normal gg]]
end

function M.cht()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "cht.sh input: ", default = file_type .. " " }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    elseif input == "h" then
      cmd = ""
    else
      local search = ""
      local delimiter = " "
      for w in (input .. delimiter):gmatch("(.-)" .. delimiter) do
        if lang == "" then
          lang = w
        else
          if search == "" then
            search = w
          else
            search = search .. "+" .. w
          end
        end
      end
      cmd = lang
      if search ~= "" then
        cmd = cmd .. "/" .. search
      end
    end
    cmd = "curl cht.sh/" .. cmd
    M.open_term(cmd, { on_open = cht_on_open, on_exit = cht_on_exit })
  end)
end


------------------ Angular ----------------------------

function M.component()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "component's path: ", default = "" }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    else
      cmd = input
    end
    cmd = "ng g c " .. cmd .. " --skipTests -is"
    M.open_term_angular(cmd, { direction = "float", close_on_exit = "true" })
  end)
end

function M.module()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "module's path: ", default = "" }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    else
      cmd = input
    end
    cmd = "ng g m " .. cmd .. "--flat --routing"
    M.open_term_angular(cmd, { direction = "float", close_on_exit = true })
  end)
end

function M.service()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "services's path: ", default = "" }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    else
      cmd = input
    end
    cmd = "ng g s " .. cmd .. " --skipTests"
    M.open_term_angular(cmd, { direction = "float", close_on_exit = true })
  end)
end

function M.tree()
  local cmd = "tree src/app/"
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  M.open_term_angular(cmd, { direction = "float", close_on_exit = false })
end

------------------ Stack Overflow ----------------------------

function M.so()
  local buf = vim.api.nvim_get_current_buf()
  lang = ""
  file_type = vim.api.nvim_buf_get_option(buf, "filetype")
  vim.ui.input({ prompt = "so input: ", default = file_type .. " " }, function(input)
    local cmd = ""
    if input == "" or not input then
      return
    elseif input == "h" then
      cmd = "-h"
    else
      cmd = input
    end
    cmd = "so " .. cmd
    M.open_term(cmd, { direction = "float" })
  end)
end

return M
