

-- npm i -g bash-language-server
require'lspconfig'["bash"].setup {
    cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
    on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
    filetypes = { "sh", "zsh" }
}
-- require'lspconfig'["bash"].setup {
--     cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
--     filetypes = { "sh", "zsh" }
-- }
