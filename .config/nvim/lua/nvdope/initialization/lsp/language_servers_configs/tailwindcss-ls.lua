local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

-- Check if tailwindls server already defined.
if not lspconfig.tailwindls then configs['tailwindls'] = {default_config = {}} end

require'lspconfig'["tailwindcss"].setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/index.js",
        "--stdio"
    },
    filetypes = O.tailwindls.filetypes,
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            -- tailwindcss lang server waits for this repsonse before providing hover
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
        end
    },
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common
}
