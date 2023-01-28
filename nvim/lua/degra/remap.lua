vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- FloaTerm configuration

vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=term --height=0.8 --width=0.7 --autoclose=2 zsh <CR>")
vim.keymap.set("n", "t", ":FloatermToggle term<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")

vim.keymap.set("n", "<C-s>", ":w <CR>")
vim.keymap.set("i", "<C-s>", ":w <CR>")
