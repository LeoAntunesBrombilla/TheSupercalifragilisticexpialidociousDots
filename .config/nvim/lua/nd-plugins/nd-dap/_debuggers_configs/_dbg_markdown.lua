local dap = require "dap"
dap.adapters.markdown = {
    type = "executable",
    name = "mockdebug",
    command = "node",
    args = {"./out/debugAdapter.js"},
    -- args = {"/tmp/test2/mrkdwn/vscode-mock-debug/src/debugAdapter.ts"},
    -- cwd = "/tmp/test2/mrkdwn/vscode-mock-debug/"
    -- cwd = vim.fn.getcwd(),
}

dap.configurations.markdown = {
    {
        type = "mock",
        request = "launch",
        name = "mock test",
		program = "/tmp/README.md",
        stopOnEntry = true,
        debugServer = 4711
    }
}
