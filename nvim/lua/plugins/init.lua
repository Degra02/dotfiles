return {
-- Colors & colorschemes

{"ziontee113/color-picker.nvim",
    config = function()
        require("color-picker")
    end,
},

{
    'decaycs/decay.nvim', as = 'decay'
},

{
    'rose-pine/neovim',
    as = 'rose-pine',
},

'folke/tokyonight.nvim',

{
  'nvim-lualine/lualine.nvim',
  -- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
},

-- icons
-- 'nvim-tree/nvim-web-devicons',
'ryanoasis/vim-devicons',

-- mkdir

'jghauser/mkdir.nvim',

-- Startup page
{
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
},

{
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	dependencies = { {'nvim-lua/plenary.nvim'} }
},

-- File explorer
{
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
},

-- Keybindings & such
{
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup {}
  end
},

-- Highlight same-name variables
'RRethy/vim-illuminate',

-- Comment lines
{
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
},

-- Smooth scrolling
'karb94/neoscroll.nvim',

-- Autoclose brackets, quotes, ...

'm4xshen/autoclose.nvim',


'ThePrimeagen/harpoon',
'mbbill/undotree',
'tpope/vim-fugitive',

-- Utils
{
  'filipdutescu/renamer.nvim',
  branch = 'master',
  dependencies = { {'nvim-lua/plenary.nvim'} }
},

-- Autocompletion in command line
{
  'gelguy/wilder.nvim',
  config = function()
      local wilder = require('wilder')
      wilder.setup({modes = {':', '/', '?'}})
      wilder.set_option('renderer', wilder.popupmenu_renderer({
          highlighter = wilder.basic_highlighter(),
          left = {' ', wilder.popupmenu_devicons()},
          right = {' ', wilder.popupmenu_scrollbar()},
      }))
  end,
},
'roxma/vim-hug-neovim-rpc',
'roxma/nvim-yarp',

-- Top bar like VSCode
{
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
},

-- LSP & debug

-- Completion framework:
'hrsh7th/nvim-cmp',

-- LSP completion source:
'hrsh7th/cmp-nvim-lsp',

-- Useful completion sources:
-- 'hrsh7th/cmp-nvim-lua',
-- 'hrsh7th/cmp-nvim-lsp-signature-help',
-- 'hrsh7th/cmp-vsnip',
-- 'hrsh7th/cmp-path',
-- 'hrsh7th/cmp-buffer',
-- 'hrsh7th/vim-vsnip',

{
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
        position = "right",
        width = 60,
    }
  end
},

'mfussenegger/nvim-dap',
{
    "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}
},
'folke/neodev.nvim',

{
    'nvim-treesitter/nvim-treesitter',
    -- build =  ':TSUpdate',
},
'nvim-treesitter/playground',
-- 'nvim-treesitter/nvim-treesitter-context',

'neovim/nvim-lspconfig',
'simrat39/rust-tools.nvim',

{
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
},

'puremourning/vimspector',

-- 'voldikss/vim-floaterm',

{
"akinsho/toggleterm.nvim",
    config = function()
  require("toggleterm").setup()
end,
},

{
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	dependencies = {
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
},
}
