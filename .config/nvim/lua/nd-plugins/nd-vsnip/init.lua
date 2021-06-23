local cmd = vim.cmd

----------------------------=== Mappings ===--------------------------
-- Expand
cmd([[imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']])
cmd([[smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']])

-- Expand or jump
cmd([[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
cmd([[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

-- Jump forward or backward
cmd([[imap <expr> <C-s>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-s>']])
cmd([[smap <expr> <C-s>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-s>']])
cmd([[imap <expr> <C-e> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-e>']])
cmd([[smap <expr> <C-e> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-e>']])

-- Load Vsnip at startup because else it's just pure pain to source it on demand
vim.api.nvim_exec([[
	autocmd FileType * call vsnip#get_complete_items(bufnr())
]], false)
