require("core")
require("plugins")
require("keymaps")

-- packer
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})
require("nvim-web-devicons").setup()
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.enew()
  vim.cmd.bw(data.buf)
  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require("nvim-treesitter.configs").setup({
  endwise = { enable = true },
  ensure_installed = { "lua", "ruby", "typescript" },
  matchup = { enable = true },
})

require("Comment").setup()
require("bufferline").setup({})
require("fidget").setup({})
require("gitsigns").setup()
require("lualine").setup()

-- require("mason").setup()

--[[ local null_ls = require("null-ls")
null_ls.setup({
sources = {
null_ls.builtins.formatting.prettier.with({
prefer_local = "node_modules/.bin",
}),
on_attach = function(client, bufnr)
if client.supports_method("textDocument/formatting") then
vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
group = augroup,
buffer = bufnr,
callback = function()
vim.lsp.buf.formatting_sync()
end,
})
end
end,
}
}) ]]

-- coc.nvim
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
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
