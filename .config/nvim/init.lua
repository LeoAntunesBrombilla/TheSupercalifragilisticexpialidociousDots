--[[

				) (				 _   _ _   _______     _ _       _     _    __       _
              (    )			| \ | | | | |  _  \   | (_)     | |   | |  / _|     | |
             ____(___			|  \| | | | | | | |___| |_  __ _| |__ | |_| |_ _   _| |
          _|`--------`|			| . ` | | | | | | / _ \ | |/ _` | '_ \| __|  _| | | | |
         (C|          |__		| |\  \ \_/ / |/ /  __/ | | (_| | | | | |_| | | |_| | |
       /` `\          /  `\		\_| \_/\___/|___/ \___|_|_|\__, |_| |_|\__|_|  \__,_|_|
       \    `========`    /		                            __/ |
        `'--------------'`		                           |___/
]] --

local cmd = vim.cmd

require("nd-modules.nd-vars.init")
cmd("luafile ~/.config/nvim/nd-settings.lua")
require("nd-modules.init")
require("nd-plugins.init")
require("nd-lsp.init")

-- TODO is there a way to do this without vimscript
cmd("source ~/.config/nvim/vimscript/functions.vim")
