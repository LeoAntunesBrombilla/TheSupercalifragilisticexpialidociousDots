

require'lspconfig'["rust"].setup {
    cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "rust" },
	root_dir = vim.loop.cwd

}

