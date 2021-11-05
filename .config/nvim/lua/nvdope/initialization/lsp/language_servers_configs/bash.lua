require "lspconfig"["bash"].setup {
	on_attach = require("nvdope.initialization.lsp.attachments").common,
	capabilities = require("nvdope.initialization.lsp.capabilities").common(),
	root_dir = vim.loop.cwd
}
