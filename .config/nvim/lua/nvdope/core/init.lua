local prefix = "nvdope.core."

local core_components = {
    "config",
}

if (Cfg.nvdope.skip_health == false) then
    table.insert(core_components, "health")
end

for i = 1, #core_components, 1 do
	require(prefix .. core_components[i])
end
