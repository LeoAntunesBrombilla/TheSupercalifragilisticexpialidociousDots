local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

-- NOTE: Plugins with `opt = true` will not be loaded at startup but only by events, commands, key, etc..
-- NOTE: Plugins that don't have the `opt = true` opt can be loaded at startup but not at certain events, commands, keys, etc...
-- NOTE: If a plugin has `opt = true/false`, then the plugin it requires are also true/false
-- NOTE: this means that if within a plugin you require = {other plugin} and set that other plugin to optional, it won't load and the dependency will break

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        ----------------------------=== Major Dependencies ===--------------------------

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
                {"nvim-telescope/telescope-media-files.nvim"}
            },
            cmd = "Telescope",
            config = function()
                require("nd-plugins.nd-telescope.init")
            end
        }

        ----------------------------=== LSP ===--------------------------

        use {
            "neovim/nvim-lspconfig",
            opt = false,
            requires = {
                {"kabouzeid/nvim-lspinstall"},
                {"ray-x/lsp_signature.nvim"}
            },
            config = function()
                require("nd-lsp.init")
            end
        }

        use {
			"glepnir/lspsaga.nvim",
			opt = true,
			event = "VimEnter"
		}

        use {
            "kosayoda/nvim-lightbulb",
            opt = true,
            after = "nvim-lspconfig",
            config = function()
                require("nd-plugins.nd-lightbulb.init")
            end
        }

        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require("nd-plugins.nd-compe.init")
            end
        }

        use {
            "hrsh7th/vim-vsnip",
            opt = true,
            event = "BufEnter",
            config = function()
                vim.cmd([[autocmd FileType * call vsnip#get_complete_items(bufnr())]])
                require("nd-plugins.nd-vsnip.init")
            end,
            requires = {
                {"rafamadriz/friendly-snippets", opt = true}
            }
        }

        use {
            "windwp/nvim-autopairs",
            opt = true,
            event = "CursorMoved",
            config = function()
                require("nd-plugins.nd-autopairs.init")
            end
        }

        --------------------------=== Debugging ===--------------------------

        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-dap.init")
            end
        }
        use {
            "nvim-telescope/telescope-dap.nvim",
            opt = true,
            after = "nvim-dap"
        }

        use {
            "Pocco81/DAPInstall",
            branch = "dev",
            opt = true,
            after = "nvim-dap",
            config = function()
                require("nd-plugins.nd-dapinstall.init")
            end
        }

        use {
            "jbyuki/one-small-step-for-vimkind",
            opt = true,
            after = "nvim-dap"
        }

        use {
            "mfussenegger/nvim-dap-python",
            opt = true,
            after = "nvim-dap",
            ft = "python"
        }

        --------------------------=== Syntax ===--------------------------

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("nd-plugins.nd-treesitter.init")
            end
        }

        use {"norcalli/nvim-base16.lua", opt = true}

        --------------------------=== Personalization ===--------------------------

        use {"kyazdani42/nvim-web-devicons"}

        use {
            "norcalli/nvim-colorizer.lua",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-colorizer.init")
            end
        }

        --------------------------=== Text Manipulation ===--------------------------

        use {
            "tpope/vim-commentary",
            opt = true,
            keys = "gc"
        }
        use {
            "mg979/vim-visual-multi",
            opt = true,
            event = "CursorMoved"
        }

        use {
            "sbdchd/neoformat",
            opt = true,
            cmd = "Neoformat"
        }

        --------------------------=== Lang Specific ===--------------------------

        use {
            "simrat39/rust-tools.nvim",
            opt = true,
            ft = "rust"
        }

        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            ft = {"html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue"},
            config = function()
                require("nd-plugins.nd-autotag.init")
            end
        }

        use {
            "folke/lua-dev.nvim",
            opt = true,
            ft = "lua"
        }

        use {
            "mfussenegger/nvim-jdtls",
            opt = true,
            ft = "java"
        }

        use {
            "cuducos/yaml.nvim",
            opt = true,
            ft = "yaml",
            config = function()
                require("yaml_nvim").init()
            end
        }

        use {
            "fladson/vim-kitty",
            opt = true,
            ft = "kitty"
        }

        use {
            "lervag/vimtex",
            opt = true,
            ft = "tex",
            config = function()
                require("nd-plugins.nd-vimtex.init")
            end
        }

        use {
            "elixir-editors/vim-elixir",
            opt = true,
            ft = {"elixir", "eelixir", "euphoria3"}
        }

        --------------------------=== Project/Code Navigation ===--------------------------

        use {
            "glepnir/dashboard-nvim",
            opt = true,
            after = "telescope.nvim",
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-dashboard.init")
            end
        }

        use {
            "akinsho/nvim-bufferline.lua",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-bufferline.init")
            end
        }

        use {
            "glepnir/galaxyline.nvim",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-galaxyline.lines.bubbles")
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            opt = true,
            after = "nvim-web-devicons",
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-nvimtree.init")
            end
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-indentblankline.init")
            end
        }

        use {
            "mbbill/undotree",
            opt = true,
            keys = "<F5>", -- custome mapping
            config = function()
                require("nd-plugins.nd-undotree.init")
            end
        }

        use {
            "folke/trouble.nvim",
            opt = true,
            cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"}
        }

        use {
            "preservim/tagbar",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-tagbar.init")
            end
        }
        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-gitsigns.init")
            end
        }

        use {
            "editorconfig/editorconfig-vim",
            opt = true,
            event = "VimEnter"
        }

        --------------------------=== Note taking ===--------------------------
        use {
            "reedes/vim-pencil",
            opt = true,
            cmd = {"Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil"}
        }

        use {
            "folke/todo-comments.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-todocomments.init")
            end
        }

        --------------------------=== Utilities  ===--------------------------

        use {
            "tweekmonster/startuptime.vim",
            opt = true,
            cmd = "StartupTime"
        }

        use {
            "Pocco81/AutoSave.nvim",
            branch = "dev",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-autosave.init")
            end
        }

        --------------------------=== Coffee and Chill ===--------------------------

        use {
            "junegunn/limelight.vim",
            opt = true,
            keys = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-limelight.init")
            end
        }

        use {
            "yuttie/comfortable-motion.vim",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-comfortablemotion.init")
            end
        }

        use {
            "Pocco81/TrueZen.nvim",
            branch = "dev",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-truezen.init")
            end
        }

        use {
            "Pocco81/HighStr.nvim",
            branch = "dev",
            opt = true,
            cmd = {"HSHighlight", "HSRmHighlight"},
            keys = {"<F3>", "<F4>"}, -- custome mappings
            config = function()
                require("nd-plugins.nd-highstr.init")
            end
        }

        use {
            "Asheq/close-buffers.vim",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-closebuffers.init")
            end
        }

        --------------------------=== Require The Plugins ===--------------------------

        --------=== (Require) LSP
        require_plugin("nvim-base16.lua")
    end
)
