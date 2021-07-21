local present, base16 = pcall(require, "base16")
if not present then
    return
end

base16(base16.themes[Cfg.nvdope.colorscheme], true)
pcall(require, "nvdope.runlevel.highlights")
