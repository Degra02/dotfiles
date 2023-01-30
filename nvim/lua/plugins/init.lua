return {
  -- Packer can manage itself
-- 'wbthomason/packer.nvim',

-- Colors & colorschemes

{"ziontee113/color-picker.nvim",
    config = function()
        require("color-picker")
    end,
},

{
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
    end
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
      wilder.set_option('pipeline', {
          wilder.branch(
          wilder.python_file_finder_pipeline({
              -- to use ripgrep : {'rg', '--files'}
              -- to use fd      : {'fd', '-tf'}
              file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'}, 
              -- to use fd      : {'fd', '-td'}
              dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
              -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
              -- found at https://github.com/nixprime/cpsm
              filters = {'fuzzy_filter', 'difflib_sorter'},
          }),
          wilder.cmdline_pipeline(),
          wilder.python_search_pipeline()
          ),
      })
      wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_border_theme({
          highlights = {
              border = 'Normal',
          },
          border = 'rounded',
      })
      ))
  end,
},

'roxma/nvim-yarp',

-- LSP & debug

-- Completion framework:
'hrsh7th/nvim-cmp',

-- LSP completion source:
'hrsh7th/cmp-nvim-lsp',

-- Useful completion sources:
'hrsh7th/cmp-nvim-lua',
'hrsh7th/cmp-nvim-lsp-signature-help',
'hrsh7th/cmp-vsnip',
'hrsh7th/cmp-path',
'hrsh7th/cmp-buffer',
'hrsh7th/vim-vsnip',

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
'nvim-treesitter/nvim-treesitter-context',

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

'voldikss/vim-floaterm',

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
