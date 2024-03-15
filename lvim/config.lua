-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end
  },

  -- Colorschemes
  { "rose-pine/neovim",         name = "rose-pine" },
  { "ellisonleao/gruvbox.nvim", priority = 1000,   config = true, opts = ... },

  -- Minimap
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Markdown

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("noice")
    end,
  },

  -- numb
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  -- APM from the greatest
  {
    "ThePrimeagen/vim-apm",
  },

  -- CodeLens extension
  {
    "E-ricus/lsp_codelens_extensions.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap"
    },
    config = function()
      require("codelens_extensions").setup()
    end,
  }

}

-- vim related options
vim.opt.guifont = "JetBrains Mono Nerd Font:h12"
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.o.scrolloff = 8
vim.o.tabstop = 2
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

local apm = require("vim-apm")
apm:setup({})

lvim.keys.normal_mode["<leader>apm"] = ":lua require('vim-apm').toggle_monitor()<CR>"

-- Set colorscheme
-- lvim.colorscheme = "rose-pine-main"
lvim.colorscheme = "gruvbox"
vim.o.background = "dark" -- or "light" for light mode

-- mappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode[";"] = ":"

lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.builtin.which_key.mappings["c"] = {
  name = "Various",
  c = {":BufferKill <cr>", "Close buffer"},
  d = {":Copilot disable <cr>", "Disable copilot"}
}

-- clangd fix
local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}


-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
  local cmp = require("cmp")
  if cmp.visible() and has_words_before() then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  else
    fallback()
  end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab
-- vim.cmd(":Copilot disable")
