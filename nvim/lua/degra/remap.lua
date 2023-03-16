vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- FloaTerm configuration

-- vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=term --height=1.0 --width=0.8 --autoclose=2 zsh <CR>")
-- vim.keymap.set("n", "t", ":FloatermToggle term<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")

vim.keymap.set("n", "<C-s>", ":w <CR>")
vim.keymap.set("i", "<C-s>", "<cmd>w <CR>")

vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
