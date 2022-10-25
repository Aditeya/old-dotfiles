local opts = { silent = true }
-- Map leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Leader key bindings
vim.keymap.set('n', '<leader>ww', ':w<cr>',  opts)
vim.keymap.set('n', '<leader>wa', ':wa<cr>', opts)
vim.keymap.set('n', '<leader>ee', ':e<cr>',  opts)
vim.keymap.set('n', '<leader>ef', ':e!<cr>', opts)

vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<cr>', opts)
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<cr>', opts)

-- Key Bindings
vim.keymap.set('', '<C-p>', '"+P', opts)
vim.keymap.set('v', '<C-c>', '"+y', opts)

-- Normal --
-- Tabbing
vim.keymap.set('n', '<S-Tab>', ':tabprev<cr>', opts)
vim.keymap.set('n', '<Tab>', ':tabnext<cr>', opts)

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>',  opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>',    opts)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>',  opts)

vim.keymap.set('n', '<leader>cf', ':lua vim.lsp.buf.formatting_sync()<cr>', opts)
