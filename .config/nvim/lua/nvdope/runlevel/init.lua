local prefix = "nvdope.runlevel."

local runlevel_modules = {
    "abbreviations",
    "mappings",
    "autocmds",
    "highlights",
}

for i = 1, #runlevel_modules, 1 do
    local ok, res = xpcall(require, debug.traceback, prefix .. runlevel_modules[i])
    if not (ok) then
        print("NVDope [E3]: There was an error loading the runlevel module '" .. runlevel_modules[i] .. "' -->")
        print(res)
    end
end
