local api = vim.api

api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- windows to close with q
api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "vim",
    "OverseerList",
    "OverseerForm",
    "fugitive",
    "toggleterm",
    "floggraph",
    "git",
    "cheat",
  },
  command = [[nnoremap <buffer><silent> q :bdelete!<CR>]],
})

api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })
api.nvim_create_autocmd("FileType", { pattern = "cheat", command = [[nnoremap <buffer><silent> q :bdelete!<CR>]] })
