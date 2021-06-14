local debuggers_prefix = "nd-plugins.nd-dap._debuggers_configs."

local debuggers_list = {
    -- debuggers_prefix .. "",
    -- debuggers_prefix .. "_dbg_python",
    debuggers_prefix .. "_dbg_lua",
    -- debuggers_prefix .. "_dbg_go",
    -- debuggers_prefix .. "_dbg_markdown",
    -- debuggers_prefix .. "_dbg_js",
}

for lang, _ in pairs(debuggers_list) do
	require(debuggers_list[lang])
end
