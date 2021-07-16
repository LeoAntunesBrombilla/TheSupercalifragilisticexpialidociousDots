
require'lspconfig'["go"].setup{
	cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
	settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
	root_dir = require'lspconfig'.util.root_pattern(".git","go.mod","."),
	init_options = {usePlaceholders = true, completeUnimported = true},
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	filetypes = { "gd", "gdscript", "gdscript3" }
}

-- require'lspconfig'.gopls.setup{
--     cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
--     settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
--     root_dir = require'lspconfig'.util.root_pattern(".git","go.mod","."),
--     init_options = {usePlaceholders = true, completeUnimported = true},
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
-- 	filetypes = { "gd", "gdscript", "gdscript3" }
-- }
