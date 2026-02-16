return {
  -- LSP
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.opt.backup = false
      vim.opt.writebackup = false
      vim.opt.updatetime = 300
      vim.opt.signcolumn = "yes"
      local keyset = vim.keymap.set
      function _G.check_back_space()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
      end

      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      keyset(
        "i",
        "<TAB>",
        'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        opts
      )
      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
      keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
      keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
      keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
      keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
      keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
      keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
      keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
      vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

      -- coc-go: organize imports on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.go", "*.ts" },
        command = "call CocAction('runCommand', 'editor.action.organizeImport')",
      })
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

  -- Linting / Formatting
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },

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
      vim.g.rustfmt_autosave = 1
    end,
  },
  { "jparise/vim-graphql" },
  { "hashivim/vim-terraform" },

  -- Copilot
  { "github/copilot.vim" },

  -- Misc
  { "sitiom/nvim-numbertoggle" },
}
