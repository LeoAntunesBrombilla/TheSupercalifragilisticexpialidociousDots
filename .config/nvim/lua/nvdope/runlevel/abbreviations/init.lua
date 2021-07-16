local function map_abbreviation(type, abbrev, replace)
	vim.cmd(type .. [[ ]] .. abbrev .. [[ ]] .. replace)
end


for abbrev, _ in pairs(Cfg.abbreviations) do
	local abb = Cfg.abbreviations[abbrev]
	map_abbreviation(abb[1], abb[2], abb[3])
end
