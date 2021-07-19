local prefix = "nvdope.core."

local core_components = {
    "config",
}

if (Cfg.nvdope.skip_health == false) then
    table.insert(core_components, "health")
end

for i = 1, #core_components, 1 do
    local ok, res = xpcall(require, debug.traceback, prefix .. core_components[i])
    if not (ok) then
        print("NVDope [E1]: There was an error loading the core component '" .. core_components[i] .. "' -->")
        print(res)
    end
end
