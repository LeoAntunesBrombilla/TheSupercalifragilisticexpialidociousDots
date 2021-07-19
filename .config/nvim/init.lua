vim.opt.shadafile = "NONE"

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin"
}

local init_modules = {
    "nvd_settings",
    "nvdope.core",
}

local sys_modules = {
	"pluginList",
	"plugins.bufferline",
	"mappings",
    "nvdope.runlevel",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

for i = 1, #init_modules, 1 do
    local ok, res = xpcall(require, debug.traceback, init_modules[i])
    if not (ok) then
        print("NVDope [E0]: There was an error loading the module '" .. init_modules[i] .. "' -->")
        print(res)
    end
end

require "options"

local async
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
			for i = 1, #sys_modules , 1 do
				local ok, res = xpcall(require, debug.traceback, sys_modules[i])
				if not (ok) then
					print("NVDope [E0]: There was an error loading the module '" .. sys_modules[i] .. "' -->")
					print(res)
				end
			end

            require("utils").hideStuff()

            async:close()
        end
    )
)

async:send()

vim.opt.shadafile = ""
