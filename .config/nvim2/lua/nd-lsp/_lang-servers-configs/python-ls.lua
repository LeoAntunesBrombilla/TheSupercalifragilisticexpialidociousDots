-- npm i -g pyright
require'lspconfig'["python"].setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "python" },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.python.diagnostics.virtual_text,
            signs = O.python.diagnostics.signs,
            underline = O.python.diagnostics.underline,
            update_in_insert = true
        })
    },
	settings = {
		python = {
			analysis = {
			typeCheckingMode = O.python.analysis.type_checking,
			autoSearchPaths = O.python.analysis.auto_search_paths,
			useLibraryCodeForTypes = O.python.analysis.use_library_code_types
			}
		}
	},
	root_dir = vim.loop.cwd
}

