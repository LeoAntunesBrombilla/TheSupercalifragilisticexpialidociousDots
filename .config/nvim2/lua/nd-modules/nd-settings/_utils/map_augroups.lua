local M = {}

local cmd = vim.cmd

local function parse_commands(cmd_tabl)
    local str_commands = ""
    for index, _ in pairs(cmd_tabl) do
        str_commands = str_commands .. "|" .. cmd_tabl[index]
    end
    return str_commands
end

function M.set_augroups(group_name, event, pattern, commands)
    cmd("augroup " .. group_name)
    cmd("autocmd!")
    cmd("autocmd " .. event .. " " .. pattern .. " " .. parse_commands(commands) .. "")
    cmd("augroup END")
end

return M
