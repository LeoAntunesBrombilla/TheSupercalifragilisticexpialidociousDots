local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] =
    lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            -- prefix = "",
            prefix = "",
            spacing = 0
        },
        signs = true,
        underline = true
    }
)
