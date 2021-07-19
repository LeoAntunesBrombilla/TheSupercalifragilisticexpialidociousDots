local fn = vim.fn
local os_utils = require("nvdope.utils.os")
local sys = Cfg.nvdope.system

CONFIG_PATH = sys.config_path or fn.stdpath("config")
DATA_PATH = sys.data_path or fn.stdpath("data")
CACHE_PATH = sys.cache_path or fn.stdpath("cache")
TERMINAL = sys.terminal or fn.expand("$TERMINAL")
USER = sys.user or fn.expand("$USER")

-- if (os_utils.get_os() == "Windows") then
-- 	SYS_SEPARATOR = [[\\]]
-- else
-- 	SYS_SEPARATOR = [[/]]
-- end
