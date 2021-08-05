local cmd = vim.cmd

cmd("packadd packer.nvim")
local present, packer = pcall(require, "packer")

if not present then
	local fn = vim.fn
	local o = vim.o
    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

    vim.fn.delete(packer_path, "rf")

	local installer_scipt = [[
		git clone https://github.com/wbthomason/packer.nvim --depth 20 ]] .. packer_path .. [[
	]]

	local function onExit(_, code)
		if code ~= 0 then
			error("Failed to install packer.nvim!")
		end
		print("Successfully installed packer.nvim")
	end

	cmd("new")
	local shell = o.shell
	o.shell = "/bin/bash"

	fn.termopen("set -e\n" .. installer_scipt, {["cwd"] = packer_path, ["on_exit"] = onExit})
	o.shell = shell

	cmd("startinsert")


    cmd("packadd packer.nvim")
    present, packer = pcall(require, "packer")

    if present then
        print("Packer.nvim fully installed and required")
    else
        error("Couldn't require packer.nvim!")
    end
end

return packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    },
    git = {
        clone_timeout = 600 -- Timeout, in seconds, for git clones
    }
}
