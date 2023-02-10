require("degra")

-- local lspconfig = require('lspconfig')
--
-- if not lspconfig.rust_hdl then
--   require'lspconfig/configs'.rust_hdl = {
--     default_config = {
--       cmd = {"vhdl_ls"};
--       filetypes = { "vhdl" };
--       root_dir = function(fname)
--         return lspconfig.util.root_pattern('vhdl_ls.toml')(fname)
--       end;
--       settings = {};
--     };
--   }
-- end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup('plugins')


local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

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


