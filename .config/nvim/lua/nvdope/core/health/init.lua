local os_utils = require("nvdope.utils.os")

for exe, _ in pairs(Cfg.nvdope.dependencies) do
	if (os_utils.assert_executable(exe)) then
		print("NVDope [EH1]: The dependency " .. exe .. " was not found. Make sure you do have it installed and is available in your $PATH")
	end
end
