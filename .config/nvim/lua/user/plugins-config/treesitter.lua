vim.cmd[[au BufRead,BufNewFile *.wgsl	set filetype=wgsl]]

require("import")

import("nvim-treesitter.parsers", function(tsparser)
	tsparser.get_parser_configs().wgsl = {
		install_info = {
			url = "https://github.com/szebniok/tree-sitter-wgsl",
			files = {"src/parser.c"},
		}
	}
end)

import("nvim-treesitter.configs", function(tsconfig)
	tsconfig.setup({
		-- A list of parser names, or "all"
		ensure_installed = {
			"markdown",
			"rust",
			"make",
			"c",
			"lua",
			"vim",
			"java",
			"javascript",
			"typescript",
			"html",
			"css",
			"dockerfile",
			"glsl",
			"wgsl",
			"jsonc",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- List of parsers to ignore installing (for "all")
		ignore_install = { "" },

		highlight = {
			-- `false` will disable the whole extension
			enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of language that will be disabled
			--disable = { "c", "rust" },

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		indent = { enable = true },
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},
	})
end, {})

-- Folding Options
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.cmd([[ autocmd BufReadPost,FileReadPost * normal zR ]])
