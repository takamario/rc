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
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- nvim-tree
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
require("nvim-web-devicons").setup()
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
require("nvim-surround").setup({})
require("CopilotChat").setup({
  debug = true,
})

-- ntpeters/vim-better-whitespace
vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = true
vim.g.strip_whitespace_confirm = false

-- rust.nvim
vim.g.rustfmt_autosave = 1

-- coc-go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  command = "call CocAction('runCommand', 'editor.action.organizeImport')",
})
