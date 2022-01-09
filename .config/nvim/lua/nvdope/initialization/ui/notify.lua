local present, notify = pcall(require, "notify")
if not present then
	return
end

notify.setup({
	stages = "fade_in_slide_out",
	render = "default",
	timeout = 5000,
	background_colour = "Normal",
	minimum_width = 50,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

vim.notify = notify
