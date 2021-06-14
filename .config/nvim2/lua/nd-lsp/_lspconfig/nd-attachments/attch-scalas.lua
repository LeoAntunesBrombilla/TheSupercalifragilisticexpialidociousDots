

local M = {}

vim.g["metals_server_version"] = "0.10.2+33-c6441eb4-SNAPSHOT"

local metals_config = require("metals").bare_config

metals_config.settings = {
	showImplicitArguments = true,
	showInferredType = true,
	excludedPackages = {
  		"akka.actor.typed.javadsl",
  		"com.github.swagger.akka.javadsl",
  		"akka.stream.javadsl",
	},
}

-- metals_config.init_options.statusBarProvider = "on"

function M.on_attach_scalas(client, bufnr)
    require'lsp'.common_on_attach(client, bufnr)
    require'metals'.initialize_or_attach(metals_config)
end


return M
