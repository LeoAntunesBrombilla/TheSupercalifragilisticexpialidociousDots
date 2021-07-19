vim.g.nvchad_theme = "onedark"

local present, base16 = pcall(require, "base16")

vim.cmd([[
	syntax on
	filetype on
	filetype plugin indent on
]])

if present then
    base16(base16.themes["onedark"], true)
    pcall(require, "highlights")
    return true
else
    return false
end


