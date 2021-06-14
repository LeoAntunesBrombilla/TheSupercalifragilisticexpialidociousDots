local cmd = vim.cmd

--=============================================================================
--SETTINGS:
--=============================================================================

-- General:
vim.go.t_Co = "256" -- Support 256 colors
vim.cmd("set iskeyword+=-") -- treat dash separated words as a word text object"
vim.cmd("set inccommand=split") -- Make substitution work in realtime
vim.go.pumheight = 10 -- Makes popup menu smaller
vim.go.fileencoding = "utf-8" -- The encoding written to file
vim.go.conceallevel = 0 -- So that I can see `` in markdown files

cmd("set colorcolumn=99999") -- fix indentline for now
cmd "set splitbelow"
cmd "set splitright"
cmd "set updatetime=300" -- update interval for gitsigns
cmd "set clipboard=unnamedplus"
vim.go.backup = false -- This is recommended by coc
vim.go.writebackup = false -- This is recommended by coc

------------------------=== General ===--------------------------
cmd "set termguicolors"
cmd "set noerrorbells"
cmd "set noswapfile"
cmd "set shell=bash"
cmd "set encoding=UTF-8"
-- cmd "scriptencoding utf-8"
cmd "set fileencoding=utf-8"
cmd "set hidden"
cmd "set cmdheight=1"
cmd "set signcolumn=no"
------------------------=== Tabs & Indentation ===--------------------------
cmd "set tabstop=4"
cmd "set shiftwidth=4"
cmd "set softtabstop=4"
-- cmd "set smarttab"
-- cmd "set shiftround"
-- cmd "set expandtab"
-- cmd "set smartindent"
cmd "set backspace=indent,eol,start" -- eventually fix this
cmd "set listchars=tab:›\\ ,trail:•,extends:#,nbsp:."
-- cmd [[set fillchars=fold:·,foldopen:-,foldclose:+,foldsep:\|]]
------------------------=== Syntax ===--------------------------
cmd "syntax enable"
cmd "syntax on"
cmd "set wrap"
-- cmd "highlight Comment cterm=italic gui=italic" -- set comments in italics
cmd "set list"
cmd "set showcmd"

-- some special chars:
-- @ł€¶ŧ←↓→øþæßðđŋħł~»¢“”nµ─·
--------------------------=== Navigation ===--------------------------
cmd "set number"
cmd "set numberwidth=2"
cmd "set mouse=a"
cmd "set lazyredraw"
cmd "set scrolloff=5"
cmd "set modelines=0"
cmd "set ttyfast"
cmd "set noshowmode"
cmd "set shortmess+=c" -- removes coc completion messages when typing when noshowmode is set
-- cmd "set noshowmode"
cmd "set matchpairs+=<:>"
cmd "set hlsearch"
cmd "set incsearch"
cmd "set ignorecase"
cmd "set smartcase"

-- cursor config
-- cmd "set cursorcolumn"
cmd "set cursorline"
-- cmd "hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=NONE guibg=NONE guifg=NONE"
cmd "set guicursor=i-c-ci:ver25,o-v-ve:hor20,cr-sm-n-r:block"
-- refer to `:help 'guicursor'`

-- coffe and confort mappings
-- cmd("set noruler")		-- disable ruler at bottom
-- cmd("noshowmode")		-- disable showing mode
-- <leader>ts				-- turn off statusline
-- https://stackoverflow.com/questions/7770413/remove-vim-bottom-line-with-mode-line-column-etc

--------------------------=== Folds ===--------------------------
cmd "set foldmethod=syntax"
cmd "set nofoldenable"
cmd "set foldlevel=99"

--[[
    using folds:
    zo - opens folds
    zc - closes fold
    zm - increases auto fold depth
    zr - reduces auto fold depth
    zR - unfold all
]]
