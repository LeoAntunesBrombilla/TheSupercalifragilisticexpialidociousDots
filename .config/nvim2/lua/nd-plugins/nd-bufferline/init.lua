
vim.o.termguicolors = true

-- local cmd = vim.cmd

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
		always_show_bufferline = false		-- hide buffer if there are less than one
    },
	highlights = {
		background = {					-- inactive tab color
			guifg = comment_fg,
			guibg = "#282c34"
		},
		buffer_selected = {				-- active tab color
			guifg = normal_fg,
			guibg = "#3A3E44",
			gui = "bold"
		},
		fill = {						-- bufferline's background color
			guifg = comment_fg,
			guibg = "#282c34"
		},
		separator_visible = {
			guifg = "#282c34",
			guibg = "#282c34"
		},
		separator_selected = {
			guifg = "#282c34",
			guibg = "#282c34"
		},
		separator = {						-- separator color. first one is the thin line; second one is the thick one
			guifg = "#393b43",
			guibg = "#282c34"
		},
		indicator_selected = {				-- separator when tab is active color
			guifg = "#1da8f2",
			guibg = "#3A3E44"
		},
		modified_selected = {				-- color when modified right hand side of the tab
			guifg = string_fg,
			guibg = "#3A3E44"
		}
	}
}

local opt = {silent = true}

-- vim.g.mapleader = " "


----------------------------=== Mappings ===--------------------------
-- Move to previous/next
vim.api.nvim_set_keymap("n", "<PageUp>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<PageDown>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
vim.api.nvim_set_keymap("i", "<PageUp>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("i", "<PageDown>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- Re-order to previous/next
vim.api.nvim_set_keymap("n", "<C-PageUp>", [[<Cmd>BufferLineMoveNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<C-PageDown>", [[<Cmd>BufferLineMovePrev<CR>]], opt)

--command that adds new buffer and moves to it
vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
vim.api.nvim_set_keymap("n","<S-b>",":New ", opt)


-- Goto buffer in position...
-- this is already set when leaving `mappings = true`
-- vim.api.nvim_set_keymap("n","<leader>1",[[lua require"bufferline".go_to_buffer(1)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leader>2",[[lua require"bufferline".go_to_buffer(2)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>3",[[lua require"bufferline".go_to_buffer(3)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>4",[[lua require"bufferline".go_to_buffer(4)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>5",[[lua require"bufferline".go_to_buffer(5)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>6",[[lua require"bufferline".go_to_buffer(6)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>7",[[lua require"bufferline".go_to_buffer(7)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>8",[[lua require"bufferline".go_to_buffer(8)<CR>]], {silent = true})
-- vim.api.nvim_set_keymap("n","<leacer>9",[[lua require"bufferline".go_to_buffer(9)<CR>]], {silent = true})

-- Close buffer
-- vim.api.nvim_set_keymap("n","<S-w>",[[<Cmd>bdelete<CR>]], opt)

-- Magic buffer-picking mode
vim.api.nvim_set_keymap("n","<S-e>",[[<Cmd>BufferLinePick<CR>]], opt)

-- Sort automatically by...
vim.api.nvim_set_keymap("n","<leader>bd",[[<Cmd>BufferLineSortByDirectory<CR>]], opt)
vim.api.nvim_set_keymap("n","<leader>bl",[[<Cmd>BufferLineSortByExtension<CR>]], opt)



