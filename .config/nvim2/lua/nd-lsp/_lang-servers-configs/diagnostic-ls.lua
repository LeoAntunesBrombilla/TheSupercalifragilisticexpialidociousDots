

require'lspconfig'["diagnosticls"].setup{
	cmd = { "diagnostic-languageserver", "--stdio" },
    filetypes = { "bash" },
	root_dir = vim.loop.cwd
}

