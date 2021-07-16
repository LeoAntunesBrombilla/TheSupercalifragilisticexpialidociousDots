

require'lspconfig'["php"].setup{
    cmd = { DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	root_dir = vim.loop.cwd
}
-- require'lspconfig'.intelephense.setup {
--     cmd = { DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common
-- }
