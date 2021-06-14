

require'lspconfig'["terraform"].setup{
    cmd = {DATA_PATH .. "/lspinstall/terraform/terraform-ls", "serve"},
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	root_dir = vim.loop.cwd
}
