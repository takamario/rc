vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({ "neoclide/coc.nvim", branch = "release" })
  -- use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  -- use "williamboman/mason-lspconfig"
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")
  use("EdenEast/nightfox.nvim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("andymass/vim-matchup")
  use("RRethy/nvim-treesitter-endwise")
  use("RRethy/vim-illuminate")
  use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
  use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
  use("numToStr/Comment.nvim")
  use({ "kylechui/nvim-surround", tag = "*" })
  use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.2", requires = { "nvim-lua/plenary.nvim" } })
  use("lewis6991/gitsigns.nvim")
  use({ "j-hui/fidget.nvim", tag = "legacy" })
  use({
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    requires = { "kkharji/sqlite.lua" },
  })
  use("ntpeters/vim-better-whitespace")
  use("tpope/vim-fugitive")
end)
