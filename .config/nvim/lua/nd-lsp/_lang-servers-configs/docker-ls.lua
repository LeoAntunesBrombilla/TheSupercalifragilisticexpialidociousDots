

-- npm install -g dockerfile-language-server-nodejs
require'lspconfig'["dockerfile"].setup {
	cmd = {DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	root_dir = vim.loop.cwd
}
-- require'lspconfig'.dockerls.setup {
--     cmd = {DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
-- 	root_dir = vim.loop.cwd
-- }
