require('import')
import('lualine', function(lualine)
	lualine.setup({
		options = {
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			theme = 'nord',
			globalstatus = true
		}
	})
end, {})
