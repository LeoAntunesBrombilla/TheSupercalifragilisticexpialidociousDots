local g = vim.g

vim.cmd([[map <leader>ll :Limelight!!<CR>]])

g.limelight_default_coefficient = 0.7
g.limelight_paragraph_span = 1

g.limelight_conceal_ctermfg = "gray"
g.limelight_conceal_ctermfg = 240

g.limelight_conceal_guifg = "DarkGray"
g.limelight_conceal_guifg = "#777777"
