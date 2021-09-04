local g = vim.g

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"
g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "packer"}
g.indent_blankline_buftype_exclude = {"terminal"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
-- g.indent_blankline_use_treesitter = true

-- uncomment to enable `colored_indent_levels` on Catppuccino.nvim
-- g.indent_blankline_char_highlight_list = {
-- 	"IndentBlanklineIndent1",
-- 	"IndentBlanklineIndent2",
-- 	"IndentBlanklineIndent3",
-- 	"IndentBlanklineIndent4",
-- 	"IndentBlanklineIndent5",
-- 	"IndentBlanklineIndent6",
-- }
