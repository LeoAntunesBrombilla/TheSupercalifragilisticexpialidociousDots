

-- note: `no_clc` would resolve to no-clc.init
local no_clc = require("no-clc")

no_clc.setup({
	load_at_startup = true,
	cursorline = true,
	cursorcolumn = false
})

