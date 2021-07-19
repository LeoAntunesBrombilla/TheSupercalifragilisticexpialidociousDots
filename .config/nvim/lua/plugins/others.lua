local M = {}

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup()
        vim.cmd("ColorizerReloadAllBuffers")
    end
end

M.comment = function()
    local present, nvim_comment = pcall(require, "nvim_comment")
    if present then
        nvim_comment.setup()
    end
end

M.lspkind = function()
    local present, lspkind = pcall(require, "lspkind")
    if present then
        lspkind.init()
    end
end

M.neoscroll = function()
    pcall(
        function()
            require("neoscroll").setup(
                {
                    mappings = {
                        "<C-u>",
                        "<C-d>",
                        "<C-b>",
                        "<C-y>",
                        "zt",
                        "zz",
                        "zb"
                    },
                    hide_cursor = true, -- Hide cursor while scrolling
                    stop_eof = true, -- Stop at <EOF> when scrolling downwards
                    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                    easing_function = nil, -- Default easing function
                    pre_hook = nil, -- Function to run before the scrolling animation starts
                    post_hook = nil -- Function to run after the scrolling animation ends
                }
            )
        end
    )
end

M.blankline = function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"

    vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
    vim.g.indent_blankline_buftype_exclude = {"terminal"}

    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
end

return M
