local M = {}

local cmd = vim.cmd

local function hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
	local parts = {group}
	if guifg then table.insert(parts, "guifg="..guifg) end
	if guibg then table.insert(parts, "guibg="..guibg) end
	if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
	if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
	if attr then
		table.insert(parts, "gui="..attr)
		table.insert(parts, "cterm="..attr)
	end
	if guisp then table.insert(parts, "guisp="..guisp) end

	cmd('highlight '..table.concat(parts, ' '))
end

function M.map_highlights(highlights)
    if not (next(highlights) == nil) then
        for highlight, vals in pairs(highlights) do
			hi(vals[1], vals[2], vals[3], vals[4], vals[5], vals[6], vals[7])
        end
    end
end

return M
