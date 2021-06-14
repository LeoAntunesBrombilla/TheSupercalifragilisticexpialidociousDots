-- :LspInstall angular
-- require'lspconfig'["angular"].setup {}
require'lspconfig'["angular"].setup {
    cmd = {DATA_PATH .. "/lspinstall/angular/node_modules/@angular/language-server/bin/ngserver", "--stdio"},
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" }
}
