-- <leader>
vim.g.mapleader = " "

-- buffer
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")
vim.keymap.set("n", "<C-l>", ":bnext<CR>", {})
vim.keymap.set("n", "<C-h>", ":bprev<CR>", {})

-- nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<C-f>", ":Telescope frecency<CR>", {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", builtin.lsp_references, {})
