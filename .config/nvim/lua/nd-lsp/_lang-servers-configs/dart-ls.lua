

require'lspconfig'["dart"].setup{
	cmd = { "dart", O.dart.sdk_path, "--lsp" },
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	init_options = {
		closingLabels = false,
		flutterOutline = false,
		onlyAnalyzeProjectsWithOpenFiles = false,
		outline = false,
		suggestFromUnimportedLibraries = true
	}
}

-- require'lspconfig'.dartls.setup{
--     cmd = { "dart", O.dart.sdk_path, "--lsp" },
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
--     init_options = {
--       closingLabels = false,
--       flutterOutline = false,
--       onlyAnalyzeProjectsWithOpenFiles = false,
--       outline = false,
--       suggestFromUnimportedLibraries = true
--     }
-- }
