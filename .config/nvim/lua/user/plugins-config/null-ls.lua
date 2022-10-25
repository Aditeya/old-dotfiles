require('import')
import('null-ls', function(null_ls)
	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.rustfmt,
		},
	})

	local on_attach = function(client, bufnr)
		if client.name == "sumneko_lua" then
			client.server_capabilities.document_formatting = false -- 0.7 and earlier
		end
		-- rest of the initialization
	end
end, {})
