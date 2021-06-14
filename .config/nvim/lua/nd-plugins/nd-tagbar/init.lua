

local g = vim.g
local api = vim.api


g.tagbar_autofocus = 1
g.tagbar_autoclose = 1


api.nvim_set_keymap(
    "n",
    "<A-w>",
    "<cmd>TagbarToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)

