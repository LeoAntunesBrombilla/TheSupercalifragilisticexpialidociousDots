
vim.api.nvim_exec([[
	autocmd BufEnter * lua require'completion'.on_attach()
	let g:completion_enable_auto_popup = 1
	let g:completion_enable_snippet = 'vim-vsnip'
	let g:completion_matching_smart_case = 1
	let g:completion_timer_cycle = 1
	let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
	set completeopt=menuone,noinsert,noselect
]], false)

