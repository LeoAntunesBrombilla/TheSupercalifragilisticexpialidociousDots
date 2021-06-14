


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		  prefix = "",
		  spacing = 0,
	},
	signs = true,
	underline = true,
})

