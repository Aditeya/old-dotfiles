-- Clipboard
vim.opt.clipboard='unnamedplus'

-- Show hidden chars
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Line number and Relative line number
vim.opt.number=true
vim.opt.relativenumber=true

-- Tab Settigns
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
-- vim.opt.expandtab=false
vim.opt.autoindent=true

-- Cursor Options
vim.opt.cursorline=true
vim.opt.cursorcolumn=true

-- Mouse & GUI settings
vim.opt.mouse='a'
vim.opt.guifont='Iosevka Slab:h9'
