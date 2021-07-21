vim.g.nvchad_theme = Cfg.nvdope.theme

local present, base16 = pcall(require, "base16")

if present then
    base16(base16.themes[Cfg.nvdope.colorscheme], true)
	pcall(require, "nvdope.runlevel.highlights")
    return true
else
    return false
end
