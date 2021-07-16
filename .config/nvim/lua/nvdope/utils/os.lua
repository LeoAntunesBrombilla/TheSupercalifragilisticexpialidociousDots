local M = {}

local fn = vim.fn

function M.get_os()
	--[[
	--	 Target OS names:
	--	 	- Windows
	--	 	- Linux
	--	 	- OSX
	--	 	- BSD
	--	 	- POSIX
	--	 	- Other
	--]]
	-- LuaJIT is bundled in Neovim
	return jit.os
end

function M.assert_executable(exe)
	if (fn.executable(exe)) then
		return true
	end

	return false
end

return M
