

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

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_bindings = {
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-}>"},    cb = tree_cb("cd") },
      { key = "s",                        cb = tree_cb("vsplit") },
      { key = "S",                        cb = tree_cb("split") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "R",                            cb = tree_cb("rename") },
      -- { key = "<C-t>",                        cb = tree_cb("tabnew") },
      -- { key = "<",                            cb = tree_cb("prev_sibling") },
      -- { key = ">",                            cb = tree_cb("next_sibling") },
      -- { key = "P",                            cb = tree_cb("parent_node") },
      -- { key = "<BS>",                         cb = tree_cb("close_node") },
      -- { key = "<S-CR>",                       cb = tree_cb("close_node") },
      -- { key = "<Tab>",                        cb = tree_cb("preview") },
      -- { key = "K",                            cb = tree_cb("first_sibling") },
      -- { key = "J",                            cb = tree_cb("last_sibling") },
      -- { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "h",                            cb = tree_cb("toggle_dotfiles") },
      { key = "r",                            cb = tree_cb("refresh") },
      -- { key = "<C->",                         cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      -- { key = "[c",                           cb = tree_cb("prev_git_item") },
      -- { key = "}c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "q",                            cb = tree_cb("close") },
      -- { key = "g?",                           cb = tree_cb("toggle_help") },
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

