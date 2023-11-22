
local custom_plugins = {
  -- TeX stuff
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      require("custom.configs.vimtex")
    end,
  },
  {
    "evesdropper/luasnip-latex-snippets.nvim",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
      "charludo/projectmgr.nvim",
      lazy = false,
  },
  {
  "neovim/nvim-lspconfig",
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
  },
  "nvim-lua/plenary.nvim",
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function ()
      require("custom.configs.rose-pine")
    end
  },
  {'zbirenbaum/copilot.lua',
    cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("custom.configs.copilot")
  end,},
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("custom.configs.navic")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("custom.configs.noice")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local M = require "plugins.configs.cmp"
  --     table.insert(M.sources, {name = "crates"})
  --     return M
  --   end,
  -- },
  {
    "rafamadriz/friendly-snippets",
    enabled = true,
  },
  {
    "mfussenegger/nvim-dap",
  }
}

return custom_plugins
