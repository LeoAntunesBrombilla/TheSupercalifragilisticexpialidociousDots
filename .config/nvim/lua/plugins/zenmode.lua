local present, true_zen = pcall(require, "true-zen")
if not present then
    return
end

true_zen.setup {
    ui = {
        bottom = {
            laststatus = 0,
            ruler = false,
            showmode = false,
            showcmd = false,
            cmdheight = 1
        },
        top = {
            showtabline = 0
        },
        left = {
            number = false,
            relativenumber = false,
            signcolumn = "no"
        }
    },
    modes = {
        ataraxis = {
            left_padding = 32,
            right_padding = 32,
            top_padding = 2,
            bottom_padding = 2,
            ideal_writing_area_width = {30, 90, "max"},
            just_do_it_for_me = true,
            keep_default_fold_fillchars = true,
            custome_bg = "",
            bg_configuration = true,
            affected_higroups = {
                NonText = {},
                FoldColumn = {},
                ColorColumn = {},
                VertSplit = {},
                StatusLine = {},
                StatusLineNC = {},
                SignColumn = {}
            }
        },
        focus = {
            margin_of_error = 5,
            focus_method = "experimental"
        }
    },
    integrations = {
        vim_gitgutter = false,
        galaxyline = true,
        tmux = true,
        gitsigns = false,
        nvim_bufferline = true,
        limelight = false,
        vim_airline = false,
        vim_powerline = false,
        vim_signify = false,
        express_line = false,
        lualine = false
    },
    misc = {
        on_off_commands = true,
        ui_elements_commands = true,
        cursor_by_mode = false
    }
}
