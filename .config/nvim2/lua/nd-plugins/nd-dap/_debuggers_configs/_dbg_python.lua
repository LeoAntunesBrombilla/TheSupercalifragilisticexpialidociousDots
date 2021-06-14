local dap = require("dap")
dap.adapters.python = {
    type = "executable",
    command = "python3.9",
    args = {"-m", "debugpy.adapter"}
}

dap.configurations.python = {
    {
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
                return cwd .. "/usr/bin/python3.9"
            elseif vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
                return cwd .. "/usr/bin/python3.9"
            else
                return "/usr/bin/python3.9"
            end
        end
    }
}
