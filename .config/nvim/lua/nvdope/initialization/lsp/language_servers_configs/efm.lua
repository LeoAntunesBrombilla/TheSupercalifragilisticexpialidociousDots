require "lspconfig"["efm"].setup {
	on_attach = require("nvdope.initialization.lsp.attachments").commmon,
	capabilities = require("nvdope.initialization.lsp.capabilities").common(),
    filetypes = {
        "lua",
		"go",
        -- "python",
        -- "json",
        "javascriptreact",
        -- "javascript",
        "typescript",
        "typescriptreact",
        "sh",
        "html",
        "css",
        "yaml",
        "markdown",
        "vue"
    },
}
