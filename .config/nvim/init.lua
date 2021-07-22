vim.opt.shadafile = "NONE"

local init_modules = {
    "nvd_settings",
    "nvdope.core",
}

local sys_modules = {
	"nvdope.initialization",
    "nvdope.runlevel"
}

for i = 1, #init_modules, 1 do
    local ok, res = xpcall(require, debug.traceback, init_modules[i])
    if not (ok) then
        print("NVDope [E0]: There was an error loading the module '" .. init_modules[i] .. "' -->")
        print(res)
    end
end

vim.opt.shortmess:append("sI")
vim.cmd [[let &fcs='eob: ']]
vim.opt.whichwrap:append("<>hl")

local async
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
            for i = 1, #sys_modules, 1 do
                local ok, res = xpcall(require, debug.traceback, sys_modules[i])
                if not (ok) then
                    print("NVDope [E0]: There was an error loading the module '" .. sys_modules[i] .. "' -->")
                    print(res)
                end
            end
            async:close()
        end
    )
)

async:send()

vim.opt.shadafile = ""
