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
        }
    },
    settings = {
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
            shortmess = {c = true}, --table insert
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
            foldlevel = 99
            -- showtabline = 2, -- always show tabs
        }
    },
    plugins = {
        lsp = {
            lspconfig = false,
            lspinstall = false,
            lspsignature = false,
            lspsaga = false,
            language_servers = {}
        },
        debug = {
            dap = true,
            dap_install = true
        },
        ui = {
            treesitter = false,
            web_devicons = false,
            colorizer = false,
            galaxyline = false,
            twilight = false,
            tree = false,
            bufferline = false,
            indent_blankline = false,
            base16 = false,
            dashboard = false
        },
        tools = {
            gitsigns = false,
            compe = false,
            vsnip = false,
            telescope = false,
            friendly_snippets = false,
            close_buffers = false,
            neoformat = false,
            pencil = false,
            autopairs = false,
            vvm = false,
            undotree = false,
            trouble = true
        },
        utils = {
            startuptime = false,
            autosave = false,
            tagbar = false,
            todo_comments = false,
            commentary = false,
            highstr = false,
            comfortable_motion = false,
            truezen = false
        },
        extensions = {
            rust_tools = false,
            lua_dev = false,
            yaml = false,
            kitty = false,
            ts_autotag = false,
            editorconfig = false
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
        -- nvim-tree
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
        -- comment
        {"n", "<leader>/", ":CommentToggle<CR>", {silent = true}},
        {"v", "<leader>/", ":CommentToggle<CR>", {silent = true}},
		-- neoformat
		{"n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], {silent = true}}
    },
    abbreviations = {
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
                "setlocal showtabline=0 nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= "
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
		{"NORMAL", nil, "#111921", nil, nil, nil, nil},
		-- {"Comment", "#42464e", nil, nil, nil, "italic", nil},
		-- {"Conditional", nil, nil, nil, nil, "italic", nil},
		-- {"Character", nil, nil, nil, nil, "undercurl", nil},
		{"SpecialChar", nil, nil, nil, nil, "underline", nil},
		-- {"Repeat", nil, nil, nil, nil, "italic", nil},
		-- {"Function", nil, nil, nil, nil, "italic", nil},
		-- {"Float", nil, nil, nil, nil, "bold", nil},

	},
    snippets = {}
}
