-- npm install -g yaml-language-server

require'lspconfig'["yaml"].setup{
	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "yaml" },
	root_dir = vim.loop.cwd
}
-- require'lspconfig'["yaml"].setup{
-- 	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
-- 	filetypes = { "yaml" }
-- }
