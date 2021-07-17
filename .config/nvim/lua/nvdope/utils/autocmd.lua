local M = {}

local cmd = vim.cmd

local function map_augroup_autocmds(augroup, group_name)
		group_name = group_name or "default_nvdope_group_name"

        cmd('augroup ' .. group_name)
        cmd('autocmd!')

		for autocmd, _ in pairs(augroup) do
			local au = augroup[autocmd]
			cmd([[autocmd ]] .. au[1] .. [[ ]] .. au[2] .. [[ ]] .. au[3])
		end

        cmd('augroup END')
end

function M.map_autocmds(autocmds)
    if not (next(autocmds) == nil) then
        for autocmd_category, _ in pairs(autocmds) do
			if not (next(autocmds[autocmd_category]) == nil) then
				map_augroup_autocmds(autocmds[autocmd_category], autocmd_category)
			end
        end
    end
end

return M
