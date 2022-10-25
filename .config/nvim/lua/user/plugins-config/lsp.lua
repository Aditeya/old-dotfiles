require('import')
import('mason', function(mason)
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end, {})

-- INFO: Language Servers to install
require('import')
import('mason-lspconfig', function(mason_lspconfig)
	mason_lspconfig.setup({
		ensure_installed = {
			"sumneko_lua",
			"angularls",
			"tsserver",
			"es_lint",
			"emmet_ls",
			"html",
			"cssmodules_ls",
			"rust_analyzer"
		},
		automatic_installation = true,
	})
end, {})

local lspconfig = require("lspconfig")
local aerial = require("aerial")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
	if client.name == "sumneko_lua" or client.name == "rust_analyzer" then
		client.server_capabilities.document_formatting = false
	end
	aerial.on_attach(client, bufnr)
end

local cwd = vim.fn.getcwd()
local node_modules_path = cwd .. "/node_modules"

local angular_cmd = {
	"ngserver",
	"--stdio",
	"--tsProbeLocations",
	node_modules_path,
	"--ngProbeLocations",
	node_modules_path,
}

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" }, -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			diagnostics = { globals = { "vim" } }, -- Get the language server to recognize the `vim` global
			workspace = { library = vim.api.nvim_get_runtime_file("", true) }, -- Make the server aware of Neovim runtime files
			telemetry = { enable = false }, -- Do not send telemetry data containing a randomized but unique identifier
		},
	},
})

lspconfig.angularls.setup({
	on_attach = aerial.on_attach,
	cmd = angular_cmd,
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = angular_cmd
	end,
})
lspconfig.tsserver.setup({ on_attach = aerial.on_attach })
lspconfig.eslint.setup({ on_attach = aerial.on_attach })
lspconfig.emmet_ls.setup({ on_attach = aerial.on_attach })
lspconfig.html.setup({ on_attach = aerial.on_attach, capabilities = capabilities })
lspconfig.cssmodules_ls.setup({
	on_attach = function(client, bufnr)
		-- avoid accepting `go-to-definition` responses from this LSP
		client.server_capabilities.goto_definition = false
		aerial.on_attach(client, bufnr)
	end,
	init_options = {
		camelCase = true,
	},
})

-- INFO: Rust lsp
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    }
})
