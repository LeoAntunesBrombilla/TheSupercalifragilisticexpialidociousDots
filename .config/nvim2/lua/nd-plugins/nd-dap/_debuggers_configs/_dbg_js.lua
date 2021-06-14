local dap = require "dap"

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = {"/tmp/test2/js_node/vscode-node-debug2/out/src/nodeDebug.js"}
}
dap.configurations.javascript = {
    {
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal"
    }
}
