


local M = {}

function M.on_attach_javaserver(client, bufnr)
	require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end



return M

