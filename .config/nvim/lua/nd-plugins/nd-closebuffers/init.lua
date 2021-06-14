

vim.api.nvim_set_keymap(
    "n",
    "<A-q>",
    ":Bdelete this<CR>",
    {
        noremap = true,
        silent = true
    }
)

