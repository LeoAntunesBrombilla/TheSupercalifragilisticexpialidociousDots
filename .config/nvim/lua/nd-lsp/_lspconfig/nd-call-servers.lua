

local ls_prefix = "nd-lsp._lang-servers-configs."

local list_language_servers = {
	ls_prefix.."efm-general-ls",
	ls_prefix.."lua-ls",
	ls_prefix.."bash-ls",
	ls_prefix.."perl-ls",
	-- ls_prefix.."clangd-ls",
	ls_prefix.."css-ls",
	ls_prefix.."elm-ls",
	ls_prefix.."php-ls",
	ls_prefix.."csharp-ls",
	ls_prefix.."cpp-ls",
	ls_prefix.."diagnostic-ls",
	-- ls_prefix.."emmet-ls",
	ls_prefix.."go-ls",
	ls_prefix.."html-ls",
	ls_prefix.."java-ls",
	ls_prefix.."json-ls",
	ls_prefix.."js-ts-ls",
	ls_prefix.."kotlin-ls",
	ls_prefix.."python-ls",
	ls_prefix.."rust-ls",
	ls_prefix.."vim-ls",
	ls_prefix.."graphql-ls",
	ls_prefix.."cmake-ls",
	ls_prefix.."yaml-ls"
}

for lang, _ in pairs(list_language_servers) do
	require(list_language_servers[lang])
end

