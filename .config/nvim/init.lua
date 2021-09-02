vim.opt.shadafile = "NONE"

local sys_modules = {
    "nvd_settings",
    "nvdope.core",
	-- "nvdope.initialization", -- packer.nvim already compiles this
    "nvdope.runlevel",
}

for i = 1, #sys_modules, 1 do
local ok, err = pcall(require, sys_modules[i])
   if not ok then
      error("Error loading " .. sys_modules[i] .. "\n\n" .. err)
   end
end

vim.opt.shadafile = ""
