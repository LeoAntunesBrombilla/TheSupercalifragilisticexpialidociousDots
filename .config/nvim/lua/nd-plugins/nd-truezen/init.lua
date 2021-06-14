-- require it
-- note: `true-zen` would resolve to true-zen.init
local true_zen = require("true-zen")

-- setup for TrueZen.nvim
true_zen.setup(
    {
        true_false_commands = true,
        cursor_by_mode = false,
        bottom = {
            hidden_laststatus = 0,
            hidden_ruler = false,
            hidden_showmode = false,
            hidden_showcmd = false,
            hidden_cmdheight = 1,
            shown_laststatus = 2,
            shown_ruler = true,
            shown_showmode = false,
            shown_showcmd = false,
            shown_cmdheight = 1
        },
        top = {
            hidden_showtabline = 0,
            shown_showtabline = 2
        },
        left = {
            hidden_number = false,
            hidden_relativenumber = false,
            hidden_signcolumn = "no",
            shown_number = true,
            shown_relativenumber = false,
            shown_signcolumn = "no"
        },
        ataraxis = {
            ideal_writing_area_width = 0,
            just_do_it_for_me = true,
            left_padding = 25,
            right_padding = 25,
            top_padding = 2,
            bottom_padding = 2,
            custome_bg = "",
            disable_bg_configuration = false,
            disable_fillchars_configuration = false,
            keep_default_fold_fillchars = true,
            force_when_plus_one_window = true,
            force_hide_statusline = false,
            quit_untoggles_ataraxis = true,
			affected_higroups = {NonText = {}, FoldColumn = {}, ColorColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}

        },
        focus = {
            margin_of_error = 5,
            focus_method = "experimental"
        },
        minimalist = {
            store_and_restore_settings = true,
            show_vals_to_read = {
                "shown_showtabline"
            }
        },
        events = {
            before_minimalist_mode_shown = false,
            before_minimalist_mode_hidden = false,
            after_minimalist_mode_shown = false,
            after_minimalist_mode_hidden = false,

            before_focus_mode_focuses = false,
            before_focus_mode_unfocuses = false,
            after_focus_mode_focuses = false,
            after_focus_mode_unfocuses = false
        },
        integrations = {
            integration_galaxyline = true,
            integration_vim_airline = false,
            integration_vim_powerline = false,
            integration_tmux = false,
            integration_express_line = false,
            integration_gitgutter = false,
            integration_vim_signify = false,
            integration_limelight = false,
            integration_tzfocus_tzataraxis = false,
            integration_gitsigns = true
        }
    }
)

true_zen.after_minimalist_mode_hidden = function()
    -- vim.cmd("echo 'I ran after minimalist mode hid everything :)'")
    -- vim.cmd("echo 'I ran before minimalist mode hid everything :)'")
    -- require("true-zen.services.bottom.integrations.integration_tmux").disable_element()

	vim.cmd("hi NonText ctermfg=NONE gui=NONE guifg=NONE guibg=NONE")
	vim.cmd("hi NonText ctermfg=8 gui=bold guifg=#545862")
end

true_zen.before_minimalist_mode_hidden = function()
    -- vim.cmd("echo 'I ran before minimalist mode hid everything :)'")

	vim.cmd("hi NonText ctermfg=NONE gui=NONE guifg=NONE guibg=NONE")
	vim.cmd("hi NonText ctermfg=8 gui=bold guifg=#545862")
end

true_zen.after_minimalist_mode_shown = function()
    -- vim.cmd("echo 'I ran after minimalist mode showed everything :)'")

	vim.cmd("hi NonText ctermfg=NONE gui=NONE guifg=NONE guibg=NONE")
	vim.cmd("hi NonText ctermfg=8 gui=bold guifg=#545862")
end

true_zen.before_minimalist_mode_shown = function()
    -- vim.cmd("echo 'I ran before minimalist mode showed everything :)'")

	vim.cmd("hi NonText ctermfg=NONE gui=NONE guifg=NONE guibg=NONE")
	vim.cmd("hi NonText ctermfg=8 gui=bold guifg=#545862")
end





true_zen.after_focus_mode_focuses = function()
    print("I ran after focus mode focused everything")
end

true_zen.after_focus_mode_unfocuses = function()
    vim.cmd("set showtabline=0")
end

-- TrueZen.nvim
vim.api.nvim_set_keymap(
    "n",
    "<F12>",
    ":TZAtaraxis<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "n",
    "<F10>",
    ":TZFocus<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "n",
    "<F9>",
    ":TZMinimalist<CR>",
    {
        noremap = true,
        silent = true
    }
)
