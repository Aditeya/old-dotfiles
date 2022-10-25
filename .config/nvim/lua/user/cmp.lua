-- Setup nvim-cmp.
local cmp           = require('cmp')
local lspkind       = require('lspkind')
local luasnip       = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

--Autopairs bracket plugin setup
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

local opts = {silent = true}
vim.keymap.set('n', 'K', vim.lsp.buf.hover , opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition , opts)
vim.keymap.set('n','<leader>gr', vim.lsp.buf.rename , opts)
vim.keymap.set('n','<leader>ga', vim.lsp.buf.code_action , opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition , opts)

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-y>"] = cmp.config.disable,
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer', keyword_length = 5 },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			with_text = true,
			menu = {
				buffer = '[BUF]',
				nvim_lsp = '[LSP]',
				nvim_lua = '[API]',
				path = '[PATH]',
				luasnip = '[SNIP]'
			}
		})
	}
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Snippet Stuff
require("luasnip.loaders.from_vscode").lazy_load()

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['tsserver'].setup {
--  capabilities = capabilities
-- }
--
-- local cwd = vim.fn.getcwd()
-- local project_library_path = cwd .. "/node_modules"
-- local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
-- require'lspconfig'.angularls.setup{
--     cmd = cmd,
--     on_new_config = function(new_config, new_root_dir)
--         new_config.cmd = cmd
--     end
-- }
