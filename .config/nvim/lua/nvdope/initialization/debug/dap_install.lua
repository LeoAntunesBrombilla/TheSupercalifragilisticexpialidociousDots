local present, dap_install = pcall(require, "dap-install")
if not present then
	return
end

dap_install.setup()

local dbg_list = require("dap-install.debuggers_list").debuggers

for debugger, _ in pairs(dbg_list) do
	dap_install.config(debugger, {})
end
