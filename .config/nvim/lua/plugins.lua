return {
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- Formatting
  { "stevearc/conform.nvim" },

  -- Linting
  { "mfussenegger/nvim-lint" },

  -- Autopairs (coc-pairs replacement)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({
        filters = {
          dotfiles = true,
          git_ignored = false,
        },
        view = {
          width = 40,
        },
      })
      local function open_nvim_tree(data)
        local real_file = vim.fn.filereadable(data.file) == 1 and not string.find(data.file, ".git/")
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        local directory = vim.fn.isdirectory(data.file) == 1

        if not real_file and not no_name then
          if not directory then
            return
          end
          vim.cmd.enew()
          vim.cmd.bw(data.buf)
          vim.cmd.cd(data.file)
        end

        require("nvim-tree.api").tree.toggle({ focus = no_name })
      end
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },

  -- Colorscheme
  { "EdenEast/nightfox.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "bash",
        "css",
        "dockerfile",
        "go",
        "graphql",
        "hcl",
        "html",
        "json",
        "lua",
        "markdown",
        "php",
        "ruby",
        "rust",
        "toml",
        "typescript",
        "yaml",
      })
    end,
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { "RRethy/nvim-treesitter-endwise" },
  { "RRethy/vim-illuminate" },

  -- UI
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({})
    end,
  },

  -- Editing
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>hs", gitsigns.stage_hunk)
          map("n", "<leader>hr", gitsigns.reset_hunk)

          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)

          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)

          map("n", "<leader>hS", gitsigns.stage_buffer)
          map("n", "<leader>hR", gitsigns.reset_buffer)
          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>hi", gitsigns.preview_hunk_inline)

          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end)

          map("n", "<leader>hd", gitsigns.diffthis)

          map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
          end)

          map("n", "<leader>hQ", function()
            gitsigns.setqflist("all")
          end)
          map("n", "<leader>hq", gitsigns.setqflist)

          -- Toggles
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
          map("n", "<leader>tw", gitsigns.toggle_word_diff)

          -- Text object
          map({ "o", "x" }, "ih", gitsigns.select_hunk)
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  -- Whitespace
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      vim.g.better_whitespace_enabled = true
      vim.g.strip_whitespace_on_save = true
      vim.g.strip_whitespace_confirm = false
    end,
  },

  -- Diff / Git
  { "sindrets/diffview.nvim" },
  { "tpope/vim-fugitive" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Language support
  { "slim-template/vim-slim" },
  { "jwalton512/vim-blade" },
  {
    "rust-lang/rust.vim",
    init = function()
      vim.g.rustfmt_autosave = 0
    end,
  },
  { "jparise/vim-graphql" },
  { "hashivim/vim-terraform" },

  -- Copilot
  { "github/copilot.vim" },

  -- Keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- Diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
      vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true })
      vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { silent = true })
    end,
  },

  -- TODO comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        signs = false,
        keywords = {
          FIX  = { icon = "F ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = "T ", color = "info" },
          HACK = { icon = "H ", color = "warning" },
          WARN = { icon = "W ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "P ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "N ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "S ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { silent = true })
    end,
  },

  -- Misc
  { "sitiom/nvim-numbertoggle" },
}
