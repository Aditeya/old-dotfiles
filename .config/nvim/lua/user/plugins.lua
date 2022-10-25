-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end

-- Reload packer on plugins.lua saved
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Protected call to prevent error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	vim.notify('Packer Require Call Failed')
	return
end

-- Float window
packer.init({
	display = {
		open_fn = require('packer.util').float,
	},
})

-- Returns the config from file name
local function get_config(name)
	return string.format('require("user.plugins-config.%s")', name)
end

-- Plugin Setup
return require('packer').startup(function(use)

	use('wbthomason/packer.nvim') -- Packer Self Management
	use('miversen33/import.nvim') -- safe imports

	-- Dependency Plugins
	use('kyazdani42/nvim-web-devicons')
	use('nvim-lua/plenary.nvim')

	-- Eye Candy
	use('shaunsingh/nord.nvim') -- Nord Colorscheme
	use({'lukas-reineke/indent-blankline.nvim', config = get_config('indent-blankline') })
	use('p00f/nvim-ts-rainbow') -- Rainbow parentheses
	use({ 'folke/todo-comments.nvim', config = get_config('todo-comments') }) -- Better Comment Highlighting
	use({ 'lewis6991/gitsigns.nvim', config = get_config('gitsigns') }) -- Line modification git signs
	use({
		'kevinhwang91/nvim-ufo',
		requires = 'kevinhwang91/promise-async',
		config = get_config('ufo')
	}) -- folding plugin

	-- ! Treesitter for better syntax highlighting
	use({
		'nvim-treesitter/nvim-treesitter',
		config = get_config('treesitter'),
		run = ':TSUpdate',
	})

	-- Manual Align
	use({ 'Vonr/align.nvim', config = get_config('align') })
	-- Comment shortcut
	use({ 'numToStr/Comment.nvim', config = get_config('comment') })
	-- Auto pair brackets
	use({ 'windwp/nvim-autopairs', config = get_config('autopairs') })
	-- Auto formatting
	use({ 'jose-elias-alvarez/null-ls.nvim', config = get_config('null-ls') })
	-- Auto Indent Detection
	use({ 'NMAC427/guess-indent.nvim', config = get_config('guess-indent') })

	-- Lualine status line
	use({ 'nvim-lualine/lualine.nvim', config = get_config('lualine') })

	-- Nvim Tree
	use({ 'kyazdani42/nvim-tree.lua', config = get_config('nvim-tree') })

	-- Aerial (code outline tree)
	use({ 'stevearc/aerial.nvim', config = get_config('aerial') })

	-- Telescope
	use({ 'nvim-telescope/telescope.nvim', config = get_config('telescope') })

	-- eww/yuck plugins
	use({ 'elkowar/yuck.vim' })
	use({ 'gpanders/nvim-parinfer' })

	use({
		'williamboman/mason.nvim',
		requires = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig'
		},
		config = get_config('lsp')
	})

	-- cmp plugins
	use('hrsh7th/nvim-cmp') --  The completion plugin
	use('hrsh7th/cmp-path') -- file path completions
	use('hrsh7th/cmp-buffer') -- buffer (current file) completions
	use('hrsh7th/cmp-cmdline') -- cmdline completions
	use('hrsh7th/cmp-nvim-lua') -- lua completions
	use('hrsh7th/cmp-nvim-lsp') -- LSP completions
	use('onsails/lspkind.nvim') -- LSP formatting

	-- snippets
	use('L3MON4D3/LuaSnip') --snippet engine
	use('saadparwaiz1/cmp_luasnip') -- snippet completions
	use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

	-- Require Packer
	if packer_bootstrap then
		require('packer').sync()
	end
end)
