local mappings = Cfg.mappings

local function map_keybinding(mode, keybinding, cmd, opts)
    opts = opts or {}
    vim.api.nvim_set_keymap(mode, keybinding, cmd, opts)
end

for mapping, _ in pairs(mappings) do
    local mp = mappings[mapping]
    map_keybinding(mp[1], mp[2], mp[3], mp[4])
end
