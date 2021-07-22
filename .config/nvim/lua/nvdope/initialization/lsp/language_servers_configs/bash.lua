require "lspconfig"["bash"].setup {
	on_attach = require("nvdope.initialization.lsp.attachments").commmon,
	capabilities = require("nvdope.initialization.lsp.capabilities").common(),
	root_dir = vim.loop.cwd
}
