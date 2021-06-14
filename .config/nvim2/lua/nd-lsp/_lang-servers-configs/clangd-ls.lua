

require'lspconfig'.clangd.setup {
    cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.clang.diagnostics.virtual_text,
            signs = O.clang.diagnostics.signs,
            underline = O.clang.diagnostics.underline,
            update_in_insert = true

        })
    },
	filetypes = { "c", "cpp", "objc", "objcpp" }
}
