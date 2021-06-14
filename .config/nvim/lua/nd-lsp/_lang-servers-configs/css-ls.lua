-- npm install -g vscode-css-languageserver-bin

require'lspconfig'["css"].setup{
	    cmd = {
        "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common
}
-- require'lspconfig'.cssls.setup {
--     cmd = {
--         "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
--         "--stdio"
--     },
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common
-- }
