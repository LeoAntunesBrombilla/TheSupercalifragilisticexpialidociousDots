

vim.o.termguicolors = true

local g = vim.g
local cmd = vim.cmd

g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_ignore = {"node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        untracked = "",
        unstaged = "",
        staged = "",
        renamed = "",
        deleted = "﯊",
        unmerged = ""
    },
    folder = {
        default = " ",
        open = " ",
        empty = " ",
        empty_open = " ",
        symlink = " ",
        symlink_open = " "
    }
}


vim.cmd [[packadd nvim-tree.lua]]

-- tree folder name , icon color
vim.cmd("hi NvimTreeFolderIcon guifg = #61afef")
vim.cmd("hi NvimTreeFolderName guifg = #61afef")
vim.cmd("hi NvimTreeIndentMarker guifg=#545862")
vim.cmd("hi CustomExplorerBg guibg=#242830") -- bg color


local get_lua_cb = function(cb_name)
    return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

-- Mappings for nvimtree
vim.api.nvim_set_keymap(
    "n",
    "<C-e>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)

-- vim.api.nvim_set_keymap(
--     "n",
--     "<C-f>",
--     ":NvimTreeFindFile<CR>",
--     {
--         -- noremap = true,
--         silent = true
--     }
-- )


g.nvim_tree_bindings = {

    ["s"] = get_lua_cb("vsplit"),
    ["S"] = get_lua_cb("split"),
    ["<BS>"] = get_lua_cb("close_node"),
    ["<CR>"] = get_lua_cb("edit"),
    -- ["<2-LeftMouse>"] = get_lua_cb("edit"),
    -- ["<2-RightMouse>"] = get_lua_cb("cd"),
    ["<C-]>"] = get_lua_cb("cd"),
    ["<S-CR>"] = get_lua_cb("close_node"),
    -- ["<Tab>"] = get_lua_cb("preview"),
    ["I"] = get_lua_cb("toggle_ignored"),
    ["H"] = get_lua_cb("toggle_dotfiles"),
    ["r"] = get_lua_cb("refresh"),
    -- ["c"] = get_lua_cb("create"),
    ["d"] = get_lua_cb("remove"),
    ["R"] = get_lua_cb("rename"),
    ["<C-r>"] = get_lua_cb("full_rename"),
    ["x"] = get_lua_cb("cut"),
    -- ["c"] = get_lua_cb("copy"),
    ["p"] = get_lua_cb("paste"),
    ["[c"] = get_lua_cb("prev_git_item"),
    ["]c"] = get_lua_cb("next_git_item"),
    ["-"] = get_lua_cb("dir_up"),
    ["q"] = get_lua_cb("close")
}


-- cmd "hi NvimTreeFolderIcon guifg = #61afef"
-- cmd "hi NvimTreeFolderName guifg = #61afef"
-- cmd "hi NvimTreeIndentMarker guifg=#383c44"
-- cmd "hi NvimTreeNormal guibg=#1b1f27"
-- cmd "hi NvimTreeVertSplit guifg=#1e222a"

cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"
cmd "hi NvimTreeIndentMarker guifg=#383c44"
cmd "hi NvimTreeNormal guibg=#111921"
cmd "hi NvimTreeVertSplit guifg=#111921"

