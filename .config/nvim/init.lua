vim.opt.shadafile = "NONE"

local sys_modules = {
    "nvd_settings",
    "nvdope.core",
	"nvdope.initialization",
    "nvdope.runlevel",
}

for i = 1, #sys_modules, 1 do
    local ok, res = xpcall(require, debug.traceback, sys_modules[i])
    if not (ok) then
        print("NVDope [E0]: There was an error loading the module '" .. sys_modules[i] .. "' -->")
        print(res)
    end
end

vim.opt.shadafile = ""
