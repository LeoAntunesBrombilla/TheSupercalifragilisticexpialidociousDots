

--[[

				) (				 _   _ _   _______     _ _       _     _    __       _
              (    )			| \ | | | | |  _  \   | (_)     | |   | |  / _|     | |
             ____(___			|  \| | | | | | | |___| |_  __ _| |__ | |_| |_ _   _| |
          _|`--------`|			| . ` | | | | | | / _ \ | |/ _` | '_ \| __|  _| | | | |
         (C|          |__		| |\  \ \_/ / |/ /  __/ | | (_| | | | | |_| | | |_| | |
       /` `\          /  `\		\_| \_/\___/|___/ \___|_|_|\__, |_| |_|\__|_|  \__,_|_|
       \    `========`    /		                            __/ |
        `'--------------'`		                           |___/
]]--


require('nd-modules.nd-vars.init')
vim.cmd('luafile ~/.config/nvim/nd-settings.lua')
-- error is here!
require('nd-modules.init')
require('nd-plugins.init')
require('nd-lsp.init')

-- TODO is there a way to do this without vimscript
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

