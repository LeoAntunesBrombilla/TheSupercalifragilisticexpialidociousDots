local pft_prefix = "nd-modules.nd-settings._per_filetype."

local list_per_filetype_configs = {
    pft_prefix .. "ftc_html"
}

for ft, _ in pairs(list_per_filetype_configs) do
    require(list_per_filetype_configs[ft])
end
