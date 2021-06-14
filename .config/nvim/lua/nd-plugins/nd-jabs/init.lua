

vim.api.nvim_set_keymap(
    "v",
    "<S-TAB>",
    ":<c-u>JABSOpen<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "n",
    "<S-TAB>",
    ":JABSOpen<CR>",
    {
        noremap = true,
        silent = true
    }
)

