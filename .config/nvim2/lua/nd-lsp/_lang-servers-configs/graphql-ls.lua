

-- npm install -g graphql-language-service-cli
require'lspconfig'["graphql"].setup {
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "graphql" },
	root_dir = vim.loop.cwd
}
