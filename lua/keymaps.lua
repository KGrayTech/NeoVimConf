local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Escape in insert/terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Indent in visual mode
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", default_opts)
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)

-- Windows navigations settings
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", default_opts)
keymap("n", "<C-Down>", ":resize -2<CR>", default_opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Set leader key
keymap("", "<Space>", "<Nop>", default_opts);
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Leader shortcuts
keymap("n", "<leader>e", ":Lex 30<cr>", default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)



