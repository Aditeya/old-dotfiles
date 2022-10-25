require('import')
import('align', function(align)
	vim.keymap.set('v', 'aa', function() align.align_to_string() end, NS) -- Align to rightmost character
end, {})
