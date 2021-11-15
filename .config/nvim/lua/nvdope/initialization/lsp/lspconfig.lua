local lspinstall = require("nvim-lsp-installer")

-- LSP installer
lspinstall.settings({
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			uninstall_server = "r",
		},
	},
	install_root_dir = vim.fn.stdpath("data") .. "/lsp_servers/",
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

local function setup_handlers()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			-- prefix = "",
			prefix = "",
			spacing = 0,
		},
		signs = true,
		underline = true,
		update_in_insert = true,
	})
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
	lspinstall.on_server_ready(function(server)
		local default_opts = {
			on_attach = require("nvdope.initialization.lsp.attachments").commmon,
			capabilities = require("nvdope.initialization.lsp.capabilities").common(),
		}

		local server_opts = {
			["eslintls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					settings = {
						format = {
							enable = true,
						},
					},
				})
			end,
			["yamlls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					settings = {
						yaml = {
							hover = true,
							completion = true,
							validate = true,
						},
						redhat = {
							telemetry = {
								enabled = false,
							},
						},
					},
				})
			end,
			["jsonls"] = function()
				return default_opts
			end,
			["bashls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					root_dir = vim.loop.cwd,
					filetypes = { "sh" },
				})
			end,
			["cmake"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					-- root_dir = vim.loop.cwd,
					filetypes = { "cmake", "make" }
				})
			end,
			["sumneko_lua"] = function()
				-- return require("lua-dev").setup({
				-- lspconfig = default_opts,
				-- })
				return vim.tbl_deep_extend("force", default_opts, {
					on_attach = require("nvdope.initialization.lsp.attachments").common,
					capabilities = require("nvdope.initialization.lsp.capabilities").lua(),
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								},
								maxPreload = 100000,
								preloadFileSize = 10000,
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
			["efm"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					root_dir = vim.loop.cwd,
					filetypes = {
						"lua",
						-- "go", -- not recommended
						-- "python", -- not recommended
						-- "json", -- not recommended
						-- "javascriptreact",
						-- "javascript", -- maybbe?
						-- "typescript",
						-- "typescriptreact",
						"sh",
						"html",
						"css",
						"yaml",
						"markdown",
						-- "vue"
					},
					settings = {
						rootMarkers = { ".git/" },
					},
				})
			end,
			["gopls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					cmd = { "gopls" },
					filetypes = { "go", "gomod" },
				})
			end,
		}

		server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	end)
end

setup_handlers()
setup_servers()

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end
