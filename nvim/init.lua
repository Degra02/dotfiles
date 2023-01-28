require("degra")

-- Neovide configs

vim.cmd ([[
let g:neovide_hide_mouse_when_typing = v:true
let g:neovide_no_idle = v:true
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h10
]])

if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end


