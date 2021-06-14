local dap_install = require("dap-install")

dap_install.setup(
    {
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
        verbosely_call_debuggers = true
    }
)

-- dap_install.config("python_dbg", {})
-- dap_install.config("go_delve_dbg", {})

-- local dbg_list = require("dap-install.debuggers_list").debuggers
-- for debugger, _ in pairs(dbg_list) do
-- 	dap_install.config(debugger, {})
-- end

-- dap_install.config("python_dbg", {})
-- dap_install.config(
--     "python_dbg",
--     {
--         adapters = {
--             type = "executable",
--             command = "python3.9",
--             args = {"-m", "debugpy.adapter"}
--         },
--         configurations = {
--             {
--                 type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
--                 request = "launch",
--                 name = "Launch file",
--                 program = "${file}", -- This configuration will launch the current file if used.
--                 pythonPath = function()
--                     local cwd = vim.fn.getcwd()
--                     if vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
--                         return cwd .. "/usr/bin/python3.9"
--                     elseif vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
--                         return cwd .. "/usr/bin/python3.9"
--                     else
--                         return "/usr/bin/python3.9"
--                     end
--                 end
--             }
--         }
--     }
-- )
