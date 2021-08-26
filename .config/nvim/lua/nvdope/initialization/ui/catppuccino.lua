local present, catppuccino = pcall(require, "catppuccino")
if not present then
    return
end

catppuccino.setup(
    {
        colorscheme = "neon_latte",
        transparency = false,
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE"
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                styles = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic"
                }
            },
            lsp_trouble = false,
            lsp_saga = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
			nvimtree = {
				enabled = true,
				show_root = false,
			},
            which_key = false,
            indent_blankline = true,
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true
        }
    }
)
catppuccino.load()
