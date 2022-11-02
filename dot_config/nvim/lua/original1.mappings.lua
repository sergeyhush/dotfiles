local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
map("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

map("n", "<C-h>", '<C-w>h', default_options)
map("n", "<C-j>", '<C-w>j', default_options)
map("n", "<C-k>", '<C-w>k', default_options)
map("n", "<C-l>", '<C-w>l', default_options)

-- LSP
map("n", "gD", '<cmd>lua vim.lsp.buf.declaration()<CR>', default_options)
map("n", "gd", '<cmd>lua vim.lsp.buf.definition()<CR>', default_options)
map("n", "gi", '<cmd>lua vim.lsp.buf.implementation()<CR>', default_options)
map("n", "gr", '<cmd>lua vim.lsp.buf.references()<CR>', default_options)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_options)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", default_options)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", default_options)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", default_options)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", default_options)
