vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({ "neoclide/coc.nvim", branch = "release" })
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
  use("sindrets/diffview.nvim")
  use("tpope/vim-fugitive")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("slim-template/vim-slim")
  use("jwalton512/vim-blade")
  use("rust-lang/rust.vim")
  use({
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    requires = { { "zbirenbaum/copilot.lua" }, { "nvim-lua/plenary.nvim" } },
    build = "make tiktoken",
    opts = { debug = true },
  })
  use("jparise/vim-graphql")
  use("hashivim/vim-terraform")
  use("sitiom/nvim-numbertoggle")
  use({
    "yetone/avante.nvim",
    config = function()
      require("avante_lib").load()
      require("avante").setup({
        provider = "claude",
        claude = {
          model = "claude-sonnet-4-20250514",
        },
        -- provider = "copilot",
        -- copilot = {
        --   -- model = "claude-4-sonnet",
        --   -- model = "gpt-4.1",
        --   -- model = "o4-mini",
        --   model = "gemini-2.5-pro",
        -- },
      })
    end,
    run = "make",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      -- "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "HakonHarnes/img-clip.nvim",
      "zbirenbaum/copilot.lua",
      -- "MeanderingProgrammer/render-markdown.nvim",
    },
  })
end)
