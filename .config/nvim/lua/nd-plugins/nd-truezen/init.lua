local true_zen = require("true-zen")

-- setup for TrueZen.nvim
true_zen.setup({
	ui = {
		bottom = {
			laststatus = 0,
			ruler = false,
			showmode = false,
			showcmd = false,
			cmdheight = 1,
		},
		top = {
			showtabline = 0,
		},
		left = {
			number = false,
			relativenumber = false,
			signcolumn = "no",
		},
	},
	modes = {
		ataraxis = {
			left_padding = 32,
			right_padding = 32,
			top_padding = 2,
			bottom_padding = 2,
			ideal_writing_area_width = 0,
			just_do_it_for_me = false,
			keep_default_fold_fillchars = true,
			custome_bg = "",
			bg_configuration = true,
			affected_higroups = {NonText = {}, FoldColumn = {}, ColorColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}
		},
		focus = {
			margin_of_error = 5,
			focus_method = "experimental"
		},
	},
	integrations = {
		vim_gitgutter = false,
		galaxyline = true,
		tmux = false,
		gitsigns = false,
		nvim_bufferline = true,
		limelight = false,
		vim_airline = false,
		vim_powerline = false,
		vim_signify = false,
		express_line = false,
	},
	misc = {
		on_off_commands = true,
		ui_elements_commands = true,
		cursor_by_mode = false,
	}
})

true_zen.before_mode_ataraxis_on = function ()
	require("no-clc.modules.cursorline.init").main(false)
end

true_zen.after_mode_ataraxis_off = function ()
	require("no-clc.modules.cursorline.init").main(true)
end

-- print("got here")
-- vim.cmd("autocmd BufWinEnter * lua require'true-zen.main'.main(4, 'on')")

-- vim.cmd([[autocmd BufWinEnter * execute "lua require'true-zen.main'.main(4, 'on')"]])

-- works, but now gotta pass the config
-- vim.cmd([[autocmd VimEnter * if exists("#BufWinEnter") | execute "lua require'true-zen.main'.main(4, 'on')" | endif]])
-- vim.cmd([[autocmd WinEnter * echo "lol2"]])
-- vim.cmd("autocmd VimEnter * call win_gotoid(g:truezen_main_window)")

-- cmd("")
-- cmd("autocmd VimEnter * wincmd l")
-- vim.cmd("autocmd VimEnter * TZAtaraxis")
