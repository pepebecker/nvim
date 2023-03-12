-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
-- Packer can manage itself
use 'wbthomason/packer.nvim'

use { 'rose-pine/neovim', as = 'rose-pine' }
use { 'folke/tokyonight.nvim', as = 'tokyonight' }

use 'nvim-tree/nvim-web-devicons'
use 'nvim-tree/nvim-tree.lua'

use 'folke/which-key.nvim'

use 'windwp/nvim-autopairs'

use 'numToStr/Comment.nvim'

use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
use('nvim-treesitter/playground')
use('JoosepAlviste/nvim-ts-context-commentstring')

use {
  'folke/neodev.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
}

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'theprimeagen/harpoon'

use 'akinsho/toggleterm.nvim'

use 'mbbill/undotree'

use 'tpope/vim-fugitive'

use 'lewis6991/gitsigns.nvim'

-- use {
--   'VonHeikemen/lsp-zero.nvim',
--   branch = 'v1.x',
--   requires = {
--     -- LSP Support
--     {'neovim/nvim-lspconfig'},             -- Required
--     {'williamboman/mason.nvim'},           -- Optional
--     {'williamboman/mason-lspconfig.nvim'}, -- Optional

--     -- Autocompletion
--     {'hrsh7th/nvim-cmp'},         -- Required
--     {'hrsh7th/cmp-nvim-lsp'},     -- Required
--     {'hrsh7th/cmp-buffer'},       -- Optional
--     {'hrsh7th/cmp-path'},         -- Optional
--     {'saadparwaiz1/cmp_luasnip'}, -- Optional
--     {'hrsh7th/cmp-nvim-lua'},     -- Optional

--     -- Snippets
--     {'L3MON4D3/LuaSnip'},             -- Required
--     {'rafamadriz/friendly-snippets'}, -- Optional
--   }
-- }

use 'folke/trouble.nvim'

use 'folke/zen-mode.nvim'

use 'github/copilot.vim'

use {
  'akinsho/bufferline.nvim', tag = 'v3.*',
  requires = 'nvim-tree/nvim-web-devicons', 
}

use {
  'nvim-lualine/lualine.nvim', as = 'lualine',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
}

use { 'michaelb/sniprun', run = 'bash ./install.sh' }

use 'nvim-orgmode/orgmode'
use 'akinsho/org-bullets.nvim'

end)

