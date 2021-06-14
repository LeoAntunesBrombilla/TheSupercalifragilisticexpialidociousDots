

local pid = vim.fn.getpid()
local omnisharp_bin = DATA_PATH.."/lspinstall/csharp/run"

require'lspconfig'["csharp"].setup{}

-- require'lspconfig'.omnisharp.setup{
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
-- 	filetypes = { "cs", "vb" },
--     init_options = {},
--     root_dir = root_pattern(".csproj", ".sln")
-- }
-- 
