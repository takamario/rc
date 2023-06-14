vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use { "neoclide/coc.nvim", branch = "release" }
  -- use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  -- use "williamboman/mason-lspconfig"
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "EdenEast/nightfox.nvim"
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "andymass/vim-matchup"
  use "RRethy/nvim-treesitter-endwise"
  use "RRethy/vim-illuminate"
  use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
  use { "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }
  use { "numToStr/Comment.nvim", config = function() require('Comment').setup() end }
  use { "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup({}) end }
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "nvim-telescope/telescope.nvim", tag = '0.1.2', requires = { 'nvim-lua/plenary.nvim' } }
  use "lewis6991/gitsigns.nvim"
  use { "j-hui/fidget.nvim", tag = "legacy" }
end)
