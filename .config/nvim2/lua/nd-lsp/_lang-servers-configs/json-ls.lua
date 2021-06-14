


require'lspconfig'["json"].setup{
	cmd = {"node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
		"--stdio"},
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
			end
		}
	},
	filetypes = { "json" }
}
-- npm install -g vscode-json-languageserver
-- require'lspconfig'.jsonls.setup {
--     cmd = {
--         "node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
--         "--stdio"
--     },
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
--     commands = {
--         Format = {
--             function()
--                 vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
--             end
--         }
--     },
-- 	filetypes = { "json" }
-- }
