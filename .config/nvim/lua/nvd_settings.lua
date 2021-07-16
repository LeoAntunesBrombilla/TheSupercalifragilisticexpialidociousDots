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
    options = {
        t_co = "256",
        inccommand = "split",
        pumheight = 10, -- pop up menu height
        fileencoding = "utf-8", -- the encoding written to a file
        encoding = "UTF-8",
        conceallevel = 0, -- so that `` is visible in markdown files
        leader = " ",
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
        shortmess = "c", --table insert
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
    },
    plugins = {
        lsp = {
            lspconfig = true,
            lspinstall = true,
            lspsignature = true,
            lspsaga = false,
            gitsigns = true
        },
        debug = {
            dap = false,
            dap_install = false
        },
        ui = {
            treesitter = true,
            web_devicons = true,
            colorizer = true,
            galaxyline = true,
            twilight = true,
            tree = true,
            bufferline = true,
            indent_blankline = true,
            base16 = true,
            dashboard = true
        },
        tools = {
            compe = true,
            vsnip = true,
            telescope = true,
            friendly_snippets = true,
            close_buffers = true,
            neoformat = true,
            pencil = true,
            autopairs = true,
            vvm = true,
            undotree = true,
            trouble = false
        },
        utils = {
            startuptime = true,
            autosave = true,
            tagbar = true,
            todo_comments = true,
            commentary = true,
            highstr = true,
            comfortable_motion = true,
            truezen = true
        },
        extensions = {
            lua_dev = true,
            yaml = true,
            kitty = true,
            ts_autotag = true,
            editorconfig = true
        },
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
        {"v", ">", ">gv", {noremap = true, silent = true}}
    },
    abbreviations = {
		{"cnoreabbrev", "W", "w"},
		{"cnoreabbrev", "Q", "q"},
		{"cnoreabbrev", "Wq", "wq"},
		{"cnoreabbrev", "Wqq", "wq"},
		{"cnoreabbrev", "WQ", "wq"},
		{"cnoreabbrev",  "wQ", "wq"},
	},
	autocmds = {
		general = {
			
		}
	},

    higroups = {

	},
    snippets = {}
}
