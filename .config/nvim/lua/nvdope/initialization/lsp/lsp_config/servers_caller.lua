local prefix = "nvdope.initialization.lsp.language_servers_configs."

local list_language_servers = {
    prefix .. "efm-general-ls",
    prefix .. "lua-ls",
    prefix .. "bash-ls",
    prefix .. "css-ls",
    prefix .. "elm-ls",
    prefix .. "diagnostic-ls",
    prefix .. "go-ls",
    prefix .. "html-ls",
    prefix .. "json-ls",
    prefix .. "js-ts-ls",
    prefix .. "kotlin-ls",
    prefix .. "python-ls",
    prefix .. "rust-ls",
    prefix .. "vim-ls",
    prefix .. "yaml-ls"
}

for lang, _ in pairs(list_language_servers) do
    require(list_language_servers[lang])
end
