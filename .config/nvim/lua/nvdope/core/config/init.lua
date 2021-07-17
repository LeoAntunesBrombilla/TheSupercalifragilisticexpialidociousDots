local opt = vim.opt
local go = vim.go
local g = vim.g


for setting, setting_value in pairs(Cfg.settings.globals) do
	g[setting] = setting_value
end

for setting, setting_value in pairs(Cfg.settings.global_options) do
	go[setting] = setting_value
end

for setting, setting_value in pairs(Cfg.settings.options) do
	if (type(setting_value) == "table") then
		opt[setting]:append(setting_value)
	else
		opt[setting] = setting_value
	end
end


-- g.mapleader = copts.mapleader

-- go.t_Co = copts.t_Co
-- go.pumheight = copts.pumheight
-- go.fileencoding = copts.fileencoding
-- go.conceallevel = copts.conceallevel

-- opt.encoding = copts.encoding
-- opt.termguicolors = copts.termguicolors
-- opt.inccommand = copts.inccommand
-- opt.updatetime = copts.updatetime
-- opt.mouse = copts.mouse
-- opt.lazyredraw = copts.lazyredraw
-- opt.scrolloff = copts.scrolloff
-- opt.modelines = copts.modelines
-- opt.hidden = copts.hidden
-- opt.ttyfast = copts.ttyfast
-- opt.colorcolumn = copts.colorcolumn
-- opt.ignorecase = copts.ignorecase

-- opt.hlsearch = copts.hlsearch
-- opt.incsearch = copts.incsearch
-- opt.smartcase = copts.smartcase
-- opt.foldmethod = copts.foldmethod
-- opt.foldenable = copts.foldenable
-- opt.foldlevel = copts.foldlevel

-- opt.tabstop = copts.tabstop
-- opt.shiftwidth = copts.shiftwidth
-- opt.softtabstop = copts.softtabstop
-- opt.errorbells = copts.errorbells
-- opt.swapfile = copts.swapfile
-- opt.shell = copts.shell
-- opt.splitbelow = copts.splitbelow
-- opt.splitright = copts.splitright
-- opt.clipboard = copts.clipboard
-- opt.list = copts.list

-- opt.listchars = copts.listchars

-- opt.backspace:append(copts.backspace)
-- opt.iskeyword:append(copts.iskeyword)
-- opt.shortmess:append(copts.shortmess)
-- opt.matchpairs:append(copts.matchpairs)

-- opt.cursorline = copts.cursorline
-- opt.cursorcolumn = copts.cursorcolumn
-- opt.guicursor = copts.guicursor
-- opt.number = copts.number
-- opt.relativenumber = copts.relativenumber
-- opt.numberwidth = copts.numberwidth
-- opt.ruler = copts.ruler
-- opt.cmdheight = copts.cmdheight
-- opt.signcolumn = copts.signcolumn
-- opt.wrap = copts.wrap
-- opt.showcmd = copts.showcmd
-- opt.showmode = copts.showmode

-- opt.backup = copts.backup
-- opt.writebackup = copts.writebackup
