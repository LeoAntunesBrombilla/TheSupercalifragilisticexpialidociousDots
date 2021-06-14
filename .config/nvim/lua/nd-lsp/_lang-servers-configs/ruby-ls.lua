-- If you are using rvm, make sure to change below configuration


require'lspconfig'["ruby"].setup{}
-- require'lspconfig'.solargraph.setup {
--     cmd = { DATA_PATH .. "~/.rbenv/shims/solargraph", "--stdio" },
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
--     handlers = {
--         ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--             virtual_text = O.ruby.diagnostics.virtual_text,
--             signs = O.ruby.diagnostics.signs,
--             underline = O.ruby.diagnostics.underline,
--             update_in_insert = true
-- 
--         })
--     },
--     filetypes = O.ruby.filetypes,
-- }
