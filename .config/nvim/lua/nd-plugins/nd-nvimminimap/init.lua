local minimap = require("minimap")

minimap.setup(
    {
        enabled = false,
        on_off_commands = true,
        hi_group = "Comment",
		events_for_update = {"InsertLeave", "BufEnter"},
		events_for_close = {"BufEnter"},
		highlight_search = true,
		conditions = {
			ignore_filetypes = {},
			ignore_buftypes = {"nofile", "nowrite", "quickfix", "terminal", "prompt"},
			close_filetypes = {"packer", "NvimTree"},
			close_buftypes = {"help", "terminal"},
		},
		win_properties = {
			style = "minimal",
			width = {5, "fixed"},
			height = {25, "relative"},
			align = "right"
		}
    }
)

