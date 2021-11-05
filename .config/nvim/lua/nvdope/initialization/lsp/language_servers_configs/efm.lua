require "lspconfig"["efm"].setup {
	on_attach = require("nvdope.initialization.lsp.attachments").common,
	capabilities = require("nvdope.initialization.lsp.capabilities").common(),
    filetypes = {
        "lua",
		-- "go", -- not recommended
        -- "python", -- not recommended
        -- "json", -- not recommended
        -- "javascriptreact",
        -- "javascript", -- maybbe?
        -- "typescript",
        -- "typescriptreact",
        "sh",
        "html",
        "css",
        "yaml",
        "markdown",
        -- "vue"
    },
}
