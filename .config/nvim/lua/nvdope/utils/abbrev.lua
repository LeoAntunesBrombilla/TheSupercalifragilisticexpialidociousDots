local M = {}

local function map_abbreviation(type, abbrev, replace)
	vim.cmd(type .. [[ ]] .. abbrev .. [[ ]] .. replace)
end

function M.load_abbreviations(abbreviations)
	if not (next(abbreviations) == nil) then
		for abbrev, _ in pairs(abbreviations) do
			local abb = abbreviations[abbrev]
			map_abbreviation(abb[1], abb[2], abb[3])
		end
	end
end

return M
