local opts = { silent = true }
require('import')
import('aerial', function(aerial) 
	aerial.setup({
		backends = { "lsp", "treesitter", },
		filter_kind = {
			"Class",
			"Constructor",
			"Enum",
			"Module",
			"Method",
			"Struct",
		},
		on_attach = function(bufnr)
			-- Toggle the aerial window with <leader>a
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', opts)
			-- Jump forwards/backwards with '{' and '}'
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-k>', '<cmd>AerialPrev<CR>', opts)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-j>', '<cmd>AerialNext<CR>', opts)
			-- Jump up the tree with '[[' or ']]'
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-K>', '<cmd>AerialPrevUp<CR>', opts)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-J>', '<cmd>AerialNextUp<CR>', opts)
		end
	})
end, {})
