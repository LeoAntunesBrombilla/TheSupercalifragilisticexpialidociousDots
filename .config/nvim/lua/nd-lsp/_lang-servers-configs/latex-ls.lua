

require'lspconfig'["latex"].setup{
	cmd = {DATA_PATH .. "/lspinstall/latex/texlab"},
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "latex" },
	root_dir = vim.loop.cwd,
	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				isContinuous = false
			},
			chktex = {
				onEdit = false,
				onOpenAndSave = false
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
		}
	}
}
-- require'lspconfig'.texlab.setup{
--     cmd = {DATA_PATH .. "/lspinstall/latex/texlab"},
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
-- 	filetypes = { "latex" }
-- }
