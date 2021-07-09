

vim.api.nvim_set_keymap(
    "n",
    "<A-q>",
    [[:Bdelete this<CR>]],
    {
        noremap = true,
        silent = true
    }
)

    -- [[:exe "lua require'minimap.modules.logic.buffer_window'.close_window()" | Bdelete this<CR>]]

