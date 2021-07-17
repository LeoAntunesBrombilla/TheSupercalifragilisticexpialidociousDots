local cmd = vim.cmd
local colors = require("nd-modules.nd-palettes.onedark")

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local light_grey = colors.light_grey
local grey = colors.grey
local grey_fg = colors.grey_fg
local red = colors.red
local line = colors.line
local green = colors.green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow
local purple = colors.purple

-- colors for active , inactive buffer tabs
require "bufferline".setup {
    options = {
        mappings = true,
        enforce_regular_tabs = true,
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        numbers = "ordinal",
        number_style = "superscript",
        diagnostics = "false",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 16,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        always_show_bufferline = false -- hide buffer if there are less than one
    },
}

---------------------------=== Mappings ===--------------------------
vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

fg_bg("BufferLineFill", grey_fg, black2)
fg_bg("BufferLineBackground", light_grey, black2)

fg_bg("BufferLineBufferVisible", light_grey, black2)
fg_bg("BufferLineBufferSelected", white, black)

cmd "hi BufferLineBufferSelected gui=bold"

-- tabs
fg_bg("BufferLineTab", light_grey, one_bg3)
fg_bg("BufferLineTabSelected", black2, nord_blue)
fg_bg("BufferLineTabClose", red, black)

fg_bg("BufferLineIndicator", black2, black2)
fg_bg("BufferLineIndicatorSelected", black, black)

-- separators
fg_bg("BufferLineSeparator", line, black2)
fg_bg("BufferLineSeparatorVisible", line, black2)
fg_bg("BufferLineSeparatorSelected", black, black2)

-- modified buffers
fg_bg("BufferLineModified", red, black2)
fg_bg("BufferLineModifiedVisible", red, black2)
fg_bg("BufferLineModifiedSelected", green, black)

-- close buttons
fg_bg("BufferLineCLoseButtonVisible", light_grey, black2)
fg_bg("BufferLineCLoseButton", light_grey, black2)
fg_bg("BufferLineCLoseButtonSelected", red, black)
