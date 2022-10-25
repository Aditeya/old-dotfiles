-- local colorscheme = 'nord'
--
-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
-- if not status_ok then
-- 	vim.notify("colorscheme " .. colorscheme .. " not found!")
-- 	return
-- end

-- Colorschemes
vim.opt.termguicolors=true
vim.opt.syntax='on'
vim.cmd([[
	if !exists('g:neovide')
		hi Normal guibg=NONE ctermbg=NONE
		hi Normal ctermbg=NONE guibg=NONE
		hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
	endif
]])

-- nord.nvim settings
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_italic = true

if vim.fn.exists("g:neovide") ~= 0 then
	vim.g.nord_disable_background = false
	vim.g.nord_cursorline_transparent = false
end

require('nord').set()
