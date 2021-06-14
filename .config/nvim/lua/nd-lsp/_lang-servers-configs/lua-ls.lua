

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'["lua"].setup{
	on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
	capabilities = capabilities,
}


-- -- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
-- local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"
-- require'lspconfig'["lua"].setup {
--     cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--     on_attach = require("nd-lsp._lspconfig.nd-attachments.attch-global").on_attach_common,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--                 -- Setup your lua path
--                 path = vim.split(package.path, ';')
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {'vim'}
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
--                 maxPreload = 10000
--             }
--         }
--     }
-- }
