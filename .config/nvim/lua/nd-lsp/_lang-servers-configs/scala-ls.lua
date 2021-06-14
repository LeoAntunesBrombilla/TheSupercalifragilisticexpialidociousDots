

require'lspconfig'.metals.setup {
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-tss").on_attach_scalas,
	filetypes = { "scala", "sbt" },
	init_options = {
		compilerOptions = {
			snippetAutoIndent = false
		},
		isHttpEnabled = true,
		statusBarProvider = "show-message"
	},
    message_level = 4,
    root_dir = util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml")
}

