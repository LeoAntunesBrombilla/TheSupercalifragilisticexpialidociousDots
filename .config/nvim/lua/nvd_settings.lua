Cfg = {
    nvdope = {
        skip_health = true,
        dependencies = {"git", "node", "npm"},
        system = {
            config_path = nil,
            data_path = nil,
            cache_path = nil,
            terminal = nil,
            user = nil
        },
        theme = "onedark", -- ui; must match a theme at Cfg.themes
        colorscheme = "onedark", -- syntax; must match a colorscheme from Base16.nvim
        language_servers = {
            "efm",
            "lua",
            "bash",
            "vim",
            "go"
        },
        treesitter_parsers = {
            "bash",
            "lua",
            "go",
            "python",
            "rust",
            "html",
            "javascript"
        }
    },
    settings = {
        disabled_builtin_tools = {
            "netrw",
            "netrwPlugin",
            "netrwSettings",
            "netrwFileHandlers",
            "gzip",
            "zip",
            "zipPlugin",
            "tar",
            "tarPlugin",
            "getscript",
            "getscriptPlugin",
            "vimball",
            "vimballPlugin",
            "2html_plugin",
            "logipat",
            "matchit",
            "rrhelper",
            "spellfile_plugin"
        },
        globals = {
            mapleader = " "
        },
        global_options = {
            t_Co = "256",
            pumheight = 10, -- pop up menu height
            fileencoding = "utf-8", -- the encoding written to a file
            conceallevel = 0 -- so that `` is visible in markdown files
        },
        options = {
            inccommand = "split",
            encoding = "UTF-8",
            colorcolumn = "99999", -- fixes indentline for now
            splitbelow = true, -- force all horizontal splits to go below current window
            splitright = true, -- force all vertical splits to go to the right of current window
            updatetime = 300, -- faster completion
            clipboard = "unnamedplus", -- allows neovim to access the system clipboard
            backup = false, -- creates a backup file
            writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
            guicursor = {"i-c-ci:ver25", "o-v-ve:hor20", "cr-sm-n-r:block"},
            backspace = {"indent", "eol", "start"}, -- table
            iskeyword = {"-"},
            shortmess = {c = true, I = true, s = true}, -- no ins-completion-menu (c), intro (I) or "search hit BOTTOM, continuing at TOP" messages
            listchars = [[tab:› ,trail:•,extends:#,nbsp:.]], -- table
            matchpairs = {"<:>"}, --table insert
            termguicolors = true, -- set term gui colors (most terminals support this)
            errorbells = false,
            swapfile = false, -- creates a swapfile
            shell = "bash",
            cmdheight = 1, -- more space in the neovim command line for displaying messages
            signcolumn = "no", -- always show the sign column, otherwise it would shift the text each time
            tabstop = 4, -- insert 2 spaces for a tab
            shiftwidth = 4, -- the number of spaces inserted for each indentation
            softtabstop = 4,
            list = true,
            wrap = true, -- display lines as one long line
            showcmd = true,
            showmode = false, -- we don't need to see things like -- INSERT -- anymore
            mouse = "a", -- allow the mouse to be used in neovim
            number = true, -- set numbered lines
            relativenumber = false, -- set relative numbered lines
            numberwidth = 2, -- set number column width to 2 {default 4}
            lazyredraw = true,
            scrolloff = 8, -- is one of my fav
            modelines = 0,
            hidden = true, -- required to keep multiple buffers and open multiple buffers
            ttyfast = true,
            hlsearch = true,
            incsearch = true,
            ignorecase = true,
            smartcase = true,
            ruler = true,
            cursorline = true, -- highlight the current line
            cursorcolumn = false,
            foldmethod = "syntax",
            foldenable = false,
            foldlevel = 99,
            cul = true
            -- showtabline = 2, -- always show tabs
        }
    },
    plugins = {
        ui = {
            bufferline = false,
            galaxyline = false,
            base16 = false,
            colorizer = false,
            treesitter = false,
            tree = false,
            web_devicons = false,
            indent_blankline = false,
            twilight = false,
            dashboard = false
        },
        lsp = {
            lspconfig = false,
            lspinstall = false,
            lspkind = false,
            lspsaga = false,
            lspsignature = false
        },
        tools = {
            compe = false,
            luasnip = false,
            friendly_snippets = false,
            neoformat = false,
            merelyfmt = false,
            plenary = false,
            popup = false,
            telescope = false,
            gitsigns = false,
            autopairs = false,
            matchup = false,
            close_buffers = false,
            pencil = false,
            vvm = false
        },
        debug = {
            dap = true,
            dap_install = true
        },
        utils = {
            startuptime = false,
            autosave = false,
            commentary = false,
            neoscroll = false,
            truezen = false,
            highstr = false
        },
        extensions = {
            lua_dev = false,
            go = false,
            rust_tools = true,
            ts_autotag = true,
            editorconfig = false,
            kitty = false
        }
    },
    mappings = {
        -- syntax: {<vim_mode>, <keybinding>, <command>, <opts>}

        -- general
        {"n", "<C-a>", [[<Cmd> %y+<CR>]], {noremap = true, silent = true}},
        -- better window movement
        {"n", "<C-S-Left>", "<C-w>h", {silent = true}},
        {"n", "<C-S-Down>", "<C-w>j", {silent = true}},
        {"n", "<C-S-Up>", "<C-w>k", {silent = true}},
        {"n", "<C-S-Right>", "<C-w>l", {silent = true}},
        -- resize windows
        {"n", "<A-j>", ":resize -2<CR>", {silent = true}},
        {"n", "<A-k>", ":resize +2<CR>", {silent = true}},
        {"n", "<A-l>", ":vertical resize -2<CR>", {silent = true}},
        {"n", "<A-h>", ":vertical resize +2<CR>", {silent = true}},
        -- open term over right
        {"n", "<C-A-t>", [[<Cmd>vnew term://bash <CR>]], {noremap = true, silent = true}},
        {"n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], {noremap = true, silent = true}},
        -- indentate text
        {"v", "<", "<gv", {noremap = true, silent = true}},
        {"v", ">", ">gv", {noremap = true, silent = true}},
        -- ctrl+backspace to delete word
        {"i", "<C-BS>", "<C-w>", {noremap = true, silent = true}},
        {"i", "<C-h>", "<C-w>", {noremap = true, silent = true}},
        -- nvimtree
        {"n", "<C-e>", ":NvimTreeToggle<CR>", {noremap = true, silent = true}},
        -- bufferline
        {"n", "<PageUp>", [[<Cmd>BufferLineCycleNext<CR>]], {silent = true}},
        {"n", "<PageDown>", [[<Cmd>BufferLineCyclePrev<CR>]], {silent = true}},
        {"i", "<PageUp>", [[<Cmd>BufferLineCycleNext<CR>]], {silent = true}},
        {"i", "<PageDown>", [[<Cmd>BufferLineCyclePrev<CR>]], {silent = true}},
        {"n", "<C-PageUp>", [[<Cmd>BufferLineMoveNext<CR>]], {silent = true}},
        {"n", "<C-PageDown>", [[<Cmd>BufferLineMovePrev<CR>]], {silent = true}},
        {"n", "<S-b>", ":New ", {silent = true}},
        {"n", "<S-e>", [[<Cmd>BufferLinePick<CR>]], {silent = true}},
        {"n", "<leader>bd", [[<Cmd>BufferLineSortByDirectory<CR>]], {silent = true}},
        {"n", "<leader>bl", [[<Cmd>BufferLineSortByExtension<CR>]], {silent = true}},
        -- close buffers
        {"n", "<A-q>", [[:Bdelete this<CR>]], {noremap = true, silent = true}},
        -- autopairs
        {"i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true}},
        -- undotree
        {"n", "<F5>", "UndotreeToggle<CR>", {noremap = true, silent = true}},
        -- tagbar
        {"n", "<A-w>", "TagbarToggle<CR>", {noremap = true, silent = true}},
        -- highstr
        {"v", "<F3>", ":<c-u>HSHighlight<CR>", {noremap = true, silent = true}},
        {"v", "<F4>", ":<c-u>HSRmHighlight<CR>", {noremap = true, silent = true}},
        -- truezen
        {"n", "<leader>zz", ":TZAtaraxis<CR>", {silent = true}},
        {"n", "<leader>zm", ":TZMinimalist<CR>", {silent = true}},
        {"n", "<leader>zf", ":TZFocus<CR>", {silent = true}},
        -- luasnip
        {
            "i",
            "<C-s>",
            [[<Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]],
            {silent = true, expr = true}
        },
        {"s", "<C-s>", [[<cmd>lua require('luasnip').jump(1)<Cr>]], {silent = true}},
        {"i", "<C-e>", [[<cmd>lua require'luasnip'.jump(-1)<Cr>]], {silent = true, noremap = true}},
        {"s", "<C-e>", [[<cmd>lua require('luasnip').jump(-1)<Cr>]], {silent = true, noremap = true}},
        -- neoformat
        {"n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], {silent = true}},
        -- sessions
        -- {"n", "<Leader>sl", [[<Cmd> SessionLoad<CR>]], {silent = true}},
        -- {"n", "<Leader>ss", [[<Cmd> SessionSave<CR>]], {silent = true}},
        -- telescope
        {"n", "<Leader>gt", [[<Cmd> Telescope git_status <CR>]], {silent = true}},
        {"n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], {silent = true}},
        {"n", "<Leader>ff", [[<Cmd> Telescope find_files <CR>]], {silent = true}},
        {"n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], {silent = true}},
        {"n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], {silent = true}},
        {"n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], {silent = true}},
        -- lspsaga
        {"n", "<Leader>sdc", [[<Cmd>Lspsaga show_cursor_diagnostics<CR>]], {silent = true}},
        {"n", "<Leader>sdl", [[<Cmd>Lspsaga show_line_diagnostics<CR>]], {silent = true}},
        {"n", "<Leader>sr", [[<Cmd>Lspsaga diagnostic_jump_next<CR>]], {silent = true}},
        {"n", "<Leader>se", [[<Cmd>Lspsaga diagnostic_jump_prev<CR>]], {silent = true}},
        {"n", "<Leader>sp", [[<Cmd>Lspsaga preview_definition<CR>]], {silent = true}},
        {"n", "<Leader>sr", [[<Cmd>Lspsaga rename<CR>]], {silent = true}},
        {"n", "<Leader>sa", [[<Cmd>Lspsaga code_action<CR>]], {silent = true}},
        {"n", "<Leader>sf", [[<Cmd>Lspsaga lsp_finder<CR>]], {silent = true}},
        {"n", "<Leader>si", [[<Cmd>Lspsaga implement<CR>]], {silent = true}},
        {"n", "<Leader>ss", [[<Cmd>Lspsaga signature_help<CR>]], {silent = true}},
        {"n", "<Leader>sh", [[<Cmd>Lspsaga hover_doc<CR>]], {silent = true}},
        -- native lsp
        {"n", "<Leader>la", [[<Cmd>LspStart<CR>]], {silent = true}},
        {"n", "<Leader>ls", [[<Cmd>LspStop<CR>]], {silent = true}},
        {"n", "<Leader>lr", [[<Cmd>LspRestart<CR>]], {silent = true}},
        {"n", "<Leader>li", [[<Cmd>LspInfo<CR>]], {silent = true}}
    },
    abbreviations = {
        -- syntax: {<abbreviation_type>, <abbreviation>, <to_abbreviate>}

        {"cnoreabbrev", "W", "w"},
        {"cnoreabbrev", "Q", "q"},
        {"cnoreabbrev", "Wq", "wq"},
        {"cnoreabbrev", "Wqq", "wq"},
        {"cnoreabbrev", "WQ", "wq"},
        {"cnoreabbrev", "wQ", "wq"}
    },
    autocmds = {
        -- syntax: {<event>, <pattern>, <command>}

        _general = {
            {"VimLeave", "*", "set guicursor=a:ver24"} -- use if on tmux
        },
        _dashboard = {
            {"FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>"},
            {
                "FileType",
                "dashboard",
                "setlocal showtabline=0 laststatus=0 nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= "
            }
        },
        _markdown = {
            {"FileType", "markdown", "setlocal wrap spell"}
        },
        _lsp = {
            {"FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>"}
        },
        _text = {
            {"FileType", "text", "setlocal wrap spell"}
        }
    },
    highlights = {
        -- syntax: {<group>, <guifg>, <guibg>, <ctermfg>, <ctermbg>, <attr>, <guisp>}

        {"Conditional", nil, nil, nil, nil, "italic", nil},
        {"Character", nil, nil, nil, nil, "undercurl", nil},
        {"SpecialChar", nil, nil, nil, nil, "underline", nil},
        {"Repeat", nil, nil, nil, nil, "italic", nil},
        {"Function", nil, nil, nil, nil, "italic", nil},
        {"Float", nil, nil, nil, nil, "bold", nil},
        {"CursorLine", nil, "#18232e", nil, nil, nil, nil}
    },
    themes = {
        onedark = {
            white = "#abb2bf",
            darker_black = "#1b1f27",
            black = "#111921", --  nvim bg
            black2 = "#252931",
            one_bg = "#282c34", -- real bg of onedark
            one_bg2 = "#353b45",
            one_bg3 = "#30343c",
            grey = "#42464e",
            grey_fg = "#565c64",
            grey_fg2 = "#6f737b",
            light_grey = "#6f737b",
            red = "#d47d85",
            baby_pink = "#DE8C92",
            pink = "#ff75a0",
            line = "#2a2e36", -- for lines like vertsplit
            green = "#A3BE8C",
            vibrant_green = "#7eca9c",
            nord_blue = "#81A1C1",
            blue = "#61afef",
            yellow = "#e7c787",
            sun = "#EBCB8B",
            purple = "#b4bbc8",
            dark_purple = "#c882e7",
            teal = "#519ABA",
            orange = "#fca2aa",
            cyan = "#a3b8ef",
            statusline_bg = "#22262e",
            lightbg = "#2d3139",
            lightbg2 = "#262a32"
        },
        nocturn = {
            white = "#b5bcc9",
            darker_black = "#10171e",
            black = "#111921", --  nvim bg
            black2 = "#1a2128",
            one_bg = "#1e252c",
            one_bg2 = "#272e35",
            one_bg3 = "#2a3138",
            grey = "#363d44",
            grey_fg = "#4e555c",
            grey_fg2 = "#51585f",
            light_grey = "#545b62",
            red = "#ef8891",
            baby_pink = "#fca2aa",
            pink = "#fca2af",
            line = "#20272e", -- for lines like vertsplit
            green = "#9ce5c0",
            vibrant_green = "#a5d4af",
            blue = "#61afef",
            nord_blue = "#9aa8cf",
            yellow = "#fbdf90",
            sun = "#fbdf9a",
            purple = "#d7c1ed",
            dark_purple = "#ccaced",
            teal = "#92dbb6",
            orange = "#EDA685",
            cyan = "#b5c3ea",
            statusline_bg = "#181f26",
            lightbg = "#222930",
            lightbg2 = "#1d242b"
        },
        gruvbox = {
            white = "#c7b89d",
            darker_black = "#1e2122",
            black = "#222526", --  nvim bg
            black2 = "#26292a",
            one_bg = "#2b2e2f",
            one_bg2 = "#2f3233",
            one_bg3 = "#313435",
            grey = "#46494a",
            grey_fg = "#5d6061",
            grey_fg2 = "#5b5e5f",
            light_grey = "#585b5c",
            red = "#ec6b64",
            baby_pink = "#ce8196",
            pink = "#ff75a0",
            line = "#2c2f30", -- for lines like vertsplit
            green = "#89b482",
            vibrant_green = "#a9b665",
            nord_blue = "#6f8faf",
            blue = "#6d8dad",
            yellow = "#d6b676",
            sun = "#d1b171",
            purple = "#b4bbc8",
            dark_purple = "#cc7f94",
            teal = "#749689",
            orange = "#e78a4e",
            cyan = "#82b3a8",
            statusline_bg = "#252829",
            lightbg = "#2d3139",
            lightbg2 = "#262a32"
        },
        nord = {
            white = "#abb2bf",
            darker_black = "#2a303c",
            black = "#2E3440", --  nvim bg
            black2 = "#343a46",
            one_bg = "#353b47", -- real bg of onedark
            one_bg2 = "#383e4a",
            one_bg3 = "#3b414d",
            grey = "#474d59",
            grey_fg = "#565c68",
            grey_fg2 = "#606672",
            light_grey = "#646a76",
            red = "#BF616A",
            baby_pink = "#de878f",
            pink = "#e89199",
            line = "#3a404c", -- for lines like vertsplit
            green = "#A3BE8C",
            vibrant_green = "#afca98",
            blue = "#7797b7",
            nord_blue = "#81A1C1",
            yellow = "#EBCB8B",
            sun = "#e1c181",
            purple = "#aab1be",
            dark_purple = "##B48EAD",
            teal = "#6484a4",
            orange = "#e39a83",
            cyan = "#9aafe6",
            statusline_bg = "#333945",
            lightbg = "#3f4551",
            lightbg2 = "#393f4b"
        },
        tomorrow_night = {
            white = "#C5C8C2",
            darker_black = "#191b1d",
            black = "#1d1f21", -- nvim bg
            black2 = "#232527",
            one_bg = "#363a41",
            one_bg2 = "#353b45",
            one_bg3 = "#30343c",
            grey = "#434547",
            grey_fg = "#545B68",
            grey_fg2 = "#616875",
            light_grey = "#676e7b",
            red = "#cc6666",
            baby_pink = "#FF6E79",
            pink = "#ff9ca3",
            line = "#27292b", -- for lines like vertsplit
            green = "#a4b595",
            vibrant_green = "#a3b991",
            nord_blue = "#728da8",
            blue = "#6f8dab",
            yellow = "#d7bd8d",
            sun = "#e4c180",
            purple = "#b4bbc8",
            dark_purple = "#b290ac",
            teal = "#8abdb6",
            orange = "#DE935F",
            cyan = "#70c0b1",
            statusline_bg = "#212326",
            lightbg = "#373B41",
            lightbg2 = "#2D3035"
        }
    }
}

local function hook_theme()
    -- syntax: {<group>, <guifg>, <guibg>, <ctermfg>, <ctermbg>, <attr>, <guisp>}
    -- Cfg.highlights[#Cfg.highlights+1] = {"", nil, nil, nil, nil, nil, nil}

    local thm = Cfg.themes[Cfg.nvdope.theme]

    -- misc
    Cfg.highlights[#Cfg.highlights + 1] = {"NORMAL", nil, thm.black, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"LineNr", thm.grey, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"Comment", thm.grey_fg, nil, nil, nil, "italic", nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimInternalError", thm.red, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"VertSplit", thm.line, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"EndOfBuffer", thm.black, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"StatusLineNC", thm.line, nil, nil, nil, "underline", nil} -- make inactive statusline a thin line

    -- indent_blankline
    Cfg.highlights[#Cfg.highlights + 1] = {"IndentBlanklineChar", thm.line, nil, nil, nil, nil, nil}

    -- pmenu
    Cfg.highlights[#Cfg.highlights + 1] = {"Pmenu", nil, thm.one_bg, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"PmenuSbar", nil, thm.one_bg2, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"PmenuSel", nil, thm.green, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"PmenuThumb", nil, thm.nord_blue, nil, nil, nil, nil}

    -- gitsings
    Cfg.highlights[#Cfg.highlights + 1] = {"DiffAdd", thm.nord_blue, "NONE", nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"DiffChange", thm.grey_fg, "NONE", nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"DiffModified", thm.nord_blue, "NONE", nil, nil, nil, nil}

    -- nvimtree
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeFolderIcon", thm.blue, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeFolderName", thm.blue, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeOpenedFolderName", thm.blue, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeEmptyFolderName", thm.blue, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeIndentMarker", thm.one_bg2, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeVertSplit", thm.darker_black, thm.darker_black, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeEndOfBuffer", thm.darker_black, nil, nil, nil, nil, nil}

    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeRootFolder", thm.darker_black, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeNormal", nil, thm.darker_black, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {
        "NvimTreeStatuslineNc",
        thm.darker_black,
        thm.darker_black,
        nil,
        nil,
        nil,
        nil
    }
    Cfg.highlights[#Cfg.highlights + 1] = {"NvimTreeWindowPicker", thm.red, thm.black2, nil, nil, nil, nil}

    -- telescope
    Cfg.highlights[#Cfg.highlights + 1] = {"TelescopeBorder", thm.line, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"TelescopePromptBorder", thm.line, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"TelescopeResultsBorder", thm.line, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"TelescopePreviewBorder", thm.line, nil, nil, nil, nil, nil}

    -- native lsp
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsSignError", thm.red, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsVirtualTextError", thm.red, nil, nil, nil, nil, nil}

    -- warnings
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsSignWarning", thm.yellow, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsVirtualTextWarning", thm.yellow, nil, nil, nil, nil, nil}

    -- info
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsSignInformation", thm.green, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsVirtualTextInformation", thm.green, nil, nil, nil, nil, nil}

    -- hint
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsSignHint", thm.white, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"LspDiagnosticsVirtualTextHint", thm.white, nil, nil, nil, nil, nil}

    -- dashboard
    Cfg.highlights[#Cfg.highlights + 1] = {"DashboardHeader", thm.grey_fg, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"DashboardCenter", thm.grey_fg, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"DashboardShortcut", thm.grey_fg, nil, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"DashboardFooter", thm.grey_fg, nil, nil, nil, nil, nil}

    -- packer (floating win)
    Cfg.highlights[#Cfg.highlights + 1] = {"NormalFloat", nil, thm.black2, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"FloatBorder", nil, thm.black2, nil, nil, nil, nil}
    Cfg.highlights[#Cfg.highlights + 1] = {"FloatBorder", thm.black2, nil, nil, nil, nil, nil}
end

local function run_hooks()
    hook_theme()
end

run_hooks()
