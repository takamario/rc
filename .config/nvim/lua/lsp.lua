-- ===========================================
-- LSP, Completion, Formatting, Linting
-- ===========================================

-- Diagnostic config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- LSP keymaps via LspAttach autocmd
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    -- gd, gr are defined in keymaps.lua via Telescope
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[g", function() vim.diagnostic.jump({ count = -1 }) end, opts)
    vim.keymap.set("n", "]g", function() vim.diagnostic.jump({ count = 1 }) end, opts)
  end,
})

-- ===========================================
-- nvim-cmp
-- ===========================================
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<TAB>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-TAB>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})

-- nvim-autopairs + cmp integration
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- ===========================================
-- Mason + LSP servers
-- ===========================================
require("mason").setup()
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "pyright",
    "ruff",
    "gopls",
    "rust_analyzer",
    "ruby_lsp",
    "phpactor",
    "html",
    "cssls",
    "tailwindcss",
    "jsonls",
    "yamlls",
    "bashls",
    "dockerls",
    "terraformls",
    "graphql",
    "lemminx",
    "taplo",
    "marksman",
    "eslint",
  },
  handlers = {
    -- Default handler
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- lua_ls: recognize `vim` global
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end,

    -- rust_analyzer: use clippy
    ["rust_analyzer"] = function()
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
          },
        },
      })
    end,

    -- pyright: disable organizeImports (ruff handles it)
    ["pyright"] = function()
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
        },
      })
    end,

    -- eslint: autoFixOnSave
    ["eslint"] = function()
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        command = "silent! EslintFixAll",
      })
    end,

    -- graphql: add typescript filetypes
    ["graphql"] = function()
      lspconfig.graphql.setup({
        capabilities = capabilities,
        filetypes = { "graphql", "typescript", "typescriptreact" },
      })
    end,
  },
})

-- Formatters / Linters (mason-tool-installer)
require("mason-tool-installer").setup({
  ensure_installed = {
    "stylua",
    "prettier",
    "ruff",
    "goimports",
    "rustfmt",
    "shfmt",
    "hadolint",
    "markdownlint",
    "shellcheck",
  },
})

-- ===========================================
-- conform.nvim (formatting)
-- ===========================================
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_organize_imports", "ruff_format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
    terraform = { "terraform_fmt" },
    toml = { "taplo" },
    sh = { "shfmt" },
  },
  format_on_save = {
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
})

-- ===========================================
-- organizeImports on save (Go, TypeScript)
-- ===========================================
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
        elseif r.command then
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})

-- ===========================================
-- nvim-lint
-- ===========================================
local lint = require("lint")
lint.linters_by_ft = {
  dockerfile = { "hadolint" },
  markdown = { "markdownlint" },
  sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    lint.try_lint()
  end,
})
