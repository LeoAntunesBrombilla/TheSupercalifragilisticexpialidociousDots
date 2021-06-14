

-- OPEN TERMINALS --
api.nvim_set_keymap("n", "<C-A-t>", [[<Cmd>vnew term://bash <CR>]], {noremap = true, silent = true}) -- open term over right
api.nvim_set_keymap("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], {noremap = true, silent = true})


-- -- TODO fix this
-- -- Terminal window navigation
-- vim.cmd([[
--   tnoremap <C-h> <C-\><C-N><C-w>h
--   tnoremap <C-j> <C-\><C-N><C-w>j
--   tnoremap <C-k> <C-\><C-N><C-w>k
--   tnoremap <C-l> <C-\><C-N><C-w>l
--   inoremap <C-h> <C-\><C-N><C-w>h
--   inoremap <C-j> <C-\><C-N><C-w>j
--   inoremap <C-k> <C-\><C-N><C-w>k
--   inoremap <C-l> <C-\><C-N><C-w>l
--   tnoremap <Esc> <C-\><C-n>
-- ]])
