-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Colors & colorschemes

use ({"ziontee113/color-picker.nvim",
    config = function()
        require("color-picker")
    end,
})

use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
    end
})

use ('folke/tokyonight.nvim')

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- icons
use ('nvim-tree/nvim-web-devicons')
use ('ryanoasis/vim-devicons')

-- mkdir
use {
  'jghauser/mkdir.nvim'
}

-- Startup page
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}

use {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
}

-- Keybindings & such
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

-- Smooth scrolling
use ('karb94/neoscroll.nvim')

-- Autoclose brackets, quotes, ...
use ('m4xshen/autoclose.nvim')


use ('ThePrimeagen/harpoon')
use ('mbbill/undotree')
use ('tpope/vim-fugitive')


-- LSP & debug
use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
use ('nvim-treesitter/playground')
use ('nvim-treesitter/nvim-treesitter-context')

use ('neovim/nvim-lspconfig')
use ('simrat39/rust-tools.nvim')

use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
}

use ('puremourning/vimspector')

use ('voldikss/vim-floaterm')

use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},         -- Required
		{'hrsh7th/cmp-nvim-lsp'},     -- Required
		{'hrsh7th/cmp-buffer'},       -- Optional
		{'hrsh7th/cmp-path'},         -- Optional
		{'saadparwaiz1/cmp_luasnip'}, -- Optional
		{'hrsh7th/cmp-nvim-lua'},     -- Optional

		-- Snippets
		{'L3MON4D3/LuaSnip'},             -- Required
		{'rafamadriz/friendly-snippets'}, -- Optional
	}

}
end)
