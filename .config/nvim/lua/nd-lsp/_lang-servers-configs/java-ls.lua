

local bundles = {
    vim.fn.glob(
        CONFIG_PATH.."/.debuggers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
};

require'lspconfig'["java"].setup {
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-javas").on_attach_javasever,
	filetypes = { "java" },
	root_dir = vim.loop.cwd
}

require'lspconfig'["jdtls"].setup {
	cmd = {DATA_PATH.."/lspinstall/java/jdtls.sh"},
	filetypes = { "java" },
	root_dir = vim.loop.cwd,
    init_options = {bundles = bundles}
}

