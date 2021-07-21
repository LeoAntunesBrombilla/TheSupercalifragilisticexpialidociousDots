local present, colorizer = pcall(require, "colorizer")
if not present then
    return
end

colorizer.setup()
vim.cmd("ColorizerReloadAllBuffers")
