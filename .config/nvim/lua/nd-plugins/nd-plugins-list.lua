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
    --	print('test '..plugin_path)
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

-- NOTES:
-- Plugins without events are loaded at startup and may be optional
-- Plugins with events are optional and loaded when certain events occurs

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        ----------------------------=== Major Dependencies ===--------------------------

        use {"nvim-lua/popup.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true} -- major dependency

        use {
			"nvim-telescope/telescope.nvim",
			opt = true,
			event = "VimEnter",
			config = function ()
				require("nd-plugins.nd-telescope.init")
			end
		}

        ----------------------------=== LSP ===--------------------------

        use {"neovim/nvim-lspconfig"}

        use {"kabouzeid/nvim-lspinstall", opt = true}

        use {
			"onsails/lspkind-nvim",
			opt = true,
			event = "VimEnter"
		}

        use {
            "glepnir/lspsaga.nvim",
            opt = true
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
			config = function ()

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

        use {
            "kyazdani42/nvim-web-devicons",
            opt = true
        }

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
            "ChristianChiarulli/dashboard-nvim",
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
			config = function ()
				require("nd-plugins.nd-bufferline.init")
			end
		}

        use {
			"glepnir/galaxyline.nvim",
			opt = true,
			event = "BufWinEnter",
			config = function ()
				require("nd-plugins.nd-galaxyline.lines.bubbles")
			end
		}

        use {
			"kyazdani42/nvim-tree.lua",
			opt = true,
			event = "BufWinEnter",
			config = function ()
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
            "folke/lsp-colors.nvim",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-lspcolors.init")
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
            event = "BufWinEnter",
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

        --------=== (Require) Major Dependencies
        require_plugin("plenary.nvim")
        require_plugin("popup.nvim")
        require_plugin("nvim-lspconfig")
        require_plugin("nvim-lspinstall")
        require_plugin("nvim-treesitter")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-base16.lua")
        require_plugin("nvim-web-devicons")
    end
)
