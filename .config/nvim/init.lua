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
local opt = vim.opt

cmd([[
	syntax off
	filetype off
	filetype plugin indent off
]])

opt.shadafile = "NONE"

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin", -- 'man',
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

local sys_components = {
    "nvd_settings",
    "nvdope.core"
    -- "nvdope.initialization",
    -- "nvdope.runlevel",
}

for i = 1, #sys_components, 1 do
    local ok, res = xpcall(require, debug.traceback, sys_components[i])
    if not (ok) then
        print("NVDope [E0]: There was an error loading the component '" .. sys_components[i] .. "' -->")
        print(res)
    end
end

require("nd-modules.nd-vars.init")
cmd("luafile ~/.config/nvim/nd-settings.lua")
require("nd-modules.init")
require("nd-plugins.init")

-- TODO is there a way to do this without vimscript
cmd("source ~/.config/nvim/vimscript/functions.vim")

opt.shadafile = ""
cmd([[
	rshada!
	syntax enable
	filetype on
	filetype plugin indent on
]])
