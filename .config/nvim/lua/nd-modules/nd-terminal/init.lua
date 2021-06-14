

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
    au BufEnter term://* setlocal nonumber
]], false)


vim.api.nvim_exec([[
	noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(19)<CR>
	noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-19)<CR>
]], false)
