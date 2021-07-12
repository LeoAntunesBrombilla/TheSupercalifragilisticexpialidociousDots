

vim.api.nvim_exec([[
	let g:VM_default_mappings = 0
	let g:VM_maps = {}
	let g:VM_maps["Add Cursor Up"] = '<C-Up>'
	let g:VM_maps["Add Cursor Down"] = '<C-Down>'
	let g:VM_maps["Select Right/Left"] = ''
	let g:VM_maps["Select Left"] = ''
]], false)

-- better window movement
api.nvim_set_keymap('n', '<C-S-Left>', '<C-w>h', {silent = true})
api.nvim_set_keymap('n', '<C-S-Down>', '<C-w>j', {silent = true})
api.nvim_set_keymap('n', '<C-S-Up>', '<C-w>k', {silent = true})
api.nvim_set_keymap('n', '<C-S-Right>', '<C-w>l', {silent = true})

-- resize windows with arrows
api.nvim_set_keymap('n', '<A-j>', ':resize -2<CR>', {silent = true})
api.nvim_set_keymap('n', '<A-k>', ':resize +2<CR>', {silent = true})
api.nvim_set_keymap('n', '<A-l>', ':vertical resize -2<CR>', {silent = true})
api.nvim_set_keymap('n', '<A-h>', ':vertical resize +2<CR>', {silent = true})

