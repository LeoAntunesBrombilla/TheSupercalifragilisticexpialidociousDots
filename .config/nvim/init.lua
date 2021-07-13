--[[
		   ) (				 _   _ _   _______
		  (    )			| \ | | | | |  _  \
		 ____(___			|  \| | | | | | | |___  _ __   ___
	  _|`--------`|			| . ` | | | | | | / _ \| '_ \ / _ \
	 (C|          |__		| |\  \ \_/ / |/ / (_) | |_) |  __/
   /` `\          /  `\		\_| \_/\___/|___/ \___/| .__/ \___|
   \    `========`    /		                       | |
	`'--------------'`		                       |_|
]] --

local cmd = vim.cmd

require("nd-modules.nd-vars.init")
cmd("luafile ~/.config/nvim/nd-settings.lua")
require("nd-modules.init")
require("nd-plugins.init")

-- TODO is there a way to do this without vimscript
cmd("source ~/.config/nvim/vimscript/functions.vim")
