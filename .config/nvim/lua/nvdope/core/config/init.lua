vim.cmd [[let &fcs='eob: ']]

for _, tool in pairs(Cfg.settings.disabled_builtin_tools) do
    vim.g["loaded_" .. tool] = 1
end

for setting, setting_value in pairs(Cfg.settings.globals) do
    vim.g[setting] = setting_value
end

for setting, setting_value in pairs(Cfg.settings.global_options) do
    vim.go[setting] = setting_value
end

for setting, setting_value in pairs(Cfg.settings.options) do
    local opt = vim.opt

    if (type(setting_value) == "table") then
        opt[setting]:append(setting_value)
    else
        opt[setting] = setting_value
    end
end
