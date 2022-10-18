local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- browser
keymap("n", "<C-b>", "<CMD>lua require('luis.utils').open_browser()<CR>", default_opts)

-- nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", default_opts)

keymap("n", "<leader>s", ":!sort<CR>", default_opts)
keymap("n", "<leader><leader>c", ":<up><CR>", default_opts)

keymap("v", "<leader>=", ":EasyAlign =<CR>", default_opts)

keymap("n", "<leader>w", ":w<CR>", default_opts)
keymap("n", "<leader>q", ":q<CR>", default_opts)

-- Better escape using jk in insert and terminal mode
keymap("i", "jj", "<ESC>", default_opts)


keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Increment/decrement
keymap('n', '+', '<C-a>', default_opts)
keymap('n', '-', '<C-x>', default_opts)

-- Delete a word backwards
keymap('n', 'dw', 'vb"_d', default_opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', default_opts)

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap('n', 'te', ':tabedit<CR>', default_opts)

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', default_opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', default_opts)

-- Move window
--keymap('n', '<Space>', '<C-w>w', default_opts)
keymap('', 'sh', '<C-w>h', default_opts)
keymap('', 'sk', '<C-w>k', default_opts)
keymap('', 'sj', '<C-w>j', default_opts)
keymap('', 'sl', '<C-w>l', default_opts)

-- Resize window
keymap('n', '<C-w><left>', '<C-w><', default_opts)
keymap('n', '<C-w><right>', '<C-w>>', default_opts)
keymap('n', '<C-w><up>', '<C-w>+', default_opts)
keymap('n', '<C-w><down>', '<C-w>-', default_opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)

keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", default_opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", default_opts)
