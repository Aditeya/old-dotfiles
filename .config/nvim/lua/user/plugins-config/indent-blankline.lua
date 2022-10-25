require('import')
import('indent_blankline', function(indent_blankline)
	indent_blankline.setup {
		space_char_blankline = " ",
		show_current_context = true,
		show_trailing_blankline_indent = false,
		show_current_context_start = true,
	}
end, {})
