local opt = vim.opt
local g = vim.g
local api = vim.api

vim.cmd("autocmd!")

-- vim.scriptencoding = 'utf-8'
-- opt.encoding = 'utf-8'
-- opt.fileencoding = 'utf-8'

vim.wo.number = true

opt.scrollback = 100000
opt.title = true
opt.completeopt = { "menuone", "noselect" }
opt.fileencoding = "utf-8"
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
-- opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false -- No Wrap lines
-- opt.wildignore:append { '*/node_modules/*' }
opt.clipboard =  'unnamedplus'

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = '*',
--   command = "set nopaste"
-- })

-- Add asterisks in block comments
-- opt.formatoptions:append { 'r' }

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
