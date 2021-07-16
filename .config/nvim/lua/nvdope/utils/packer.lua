local M = {}

--- Check if a file or directory exists in this path
function M.require_plugin(plugin)
    local plugin_prefix = DATA_PATH .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

return M
