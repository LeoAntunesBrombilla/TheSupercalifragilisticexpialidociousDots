local execute = vim.api.nvim_command
local fn = vim.fn
local packer_util = require("nvdope.utils.packer")
local plugs = Cfg.plugins

local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

-- NOTE: Plugins with `opt = true` will not be loaded at startup but only by events, commands, key, etc..
-- NOTE: Plugins that don't have the `opt = true` opt can be loaded at startup but not at certain events, commands, keys, etc...
-- NOTE: If a plugin has `opt = true/false`, then the plugin it requires are also true/false
-- NOTE: this means that if within a plugin you require = {other plugin} and set that other plugin to optional, it won't load and the dependency will break

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        use {
            "neovim/nvim-lspconfig",
            opt = false,
            requires = {
                {
					"kabouzeid/nvim-lspinstall",
					disable = plugs.lsp.lspinstall
				},
            },
            config = function()
				require("nvdope.initialization.lsp.lsp_install.init")
				require("nvdope.initialization.lsp.lsp_config.init")
				require("nvdope.initialization.lsp.lsp_pictograms.init")
            end,
			disable = plugs.lsp.lspconfig
        }

        use {
			"glepnir/lspsaga.nvim",
			opt = true,
			after = "nvim-lspconfig",
			config = function ()
				require("nvdope.initialization.lsp.lsp_saga.init")
			end,
			disable = plugs.lsp.lspsaga
		}

		use {
			"ray-x/lsp_signature.nvim",
			opt = true,
			after = "nvim-lspconfig",
			config = function ()
				require("nvdope.initialization.lsp.lsp_signature.init")
			end,
			disable = plugs.lsp.lspsignature
		}

        ----------------------------=== Major Dependencies ===--------------------------

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
            },
            cmd = "Telescope",
            config = function()
                require("nd-plugins.nd-telescope.init")
            end,
			disable = plugs.tools.telescope
        }

        ----------------------------=== LSP ===--------------------------


        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require("nd-plugins.nd-compe.init")
            end,
			disable = plugs.tools.telescope
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
                {"rafamadriz/friendly-snippets", opt = true, disable = plugs.tools.friendly_snippets}
            },
			disable = plugs.tools.vsnip
        }

        use {
            "windwp/nvim-autopairs",
            opt = true,
            event = "CursorMoved",
            config = function()
                require("nd-plugins.nd-autopairs.init")
            end,
			disable = plugs.tools.autopairs
        }

        --------------------------=== Debugging ===--------------------------

        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-dap.init")
            end,
			disable = plugs.debug.dap
        }

        use {
            "Pocco81/DAPInstall",
            branch = "dev",
            opt = true,
            after = "nvim-dap",
            config = function()
                require("nd-plugins.nd-dapinstall.init")
            end,
			disable = plugs.debug.dap_install
        }

        --------------------------=== Syntax ===--------------------------

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("nd-plugins.nd-treesitter.init")
            end,
			disable = plugs.ui.treesitter
        }

        use {
			"norcalli/nvim-base16.lua",
			opt = true,
			disable = plugs.ui.base16
		}

        --------------------------=== Personalization ===--------------------------

        use {
			"kyazdani42/nvim-web-devicons",
			disable = plugs.ui.web_devicons
		}

        use {
            "norcalli/nvim-colorizer.lua",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-colorizer.init")
            end,
			disable = plugs.ui.colorizer
        }

        --------------------------=== Text Manipulation ===--------------------------

        use {
            "tpope/vim-commentary",
            opt = true,
            keys = "gc",
			disable = plugs.utils.commentary
        }
        use {
            "mg979/vim-visual-multi",
            opt = true,
            event = "CursorMoved",
			disable = plugs.tools.vvm
        }

        use {
            "sbdchd/neoformat",
            opt = true,
            cmd = "Neoformat",
			disable = plugs.tools.neoformat
        }

        --------------------------=== Lang Specific ===--------------------------

        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            ft = {"html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue"},
            config = function()
                require("nd-plugins.nd-autotag.init")
            end,
			disable = plugs.extensions.ts_autotag
        }

        use {
            "folke/lua-dev.nvim",
            opt = true,
            ft = "lua",
			disable = plugs.extensions.lua_dev
        }

        use {
            "cuducos/yaml.nvim",
            opt = true,
            ft = "yaml",
            config = function()
                require("yaml_nvim").init()
            end,
			disable = plugs.extensions.yaml
        }

        use {
            "fladson/vim-kitty",
            opt = true,
            ft = "kitty",
			disable = plugs.extensions.kitty
        }

        --------------------------=== Project/Code Navigation ===--------------------------

        use {
            "glepnir/dashboard-nvim",
            opt = true,
            after = "telescope.nvim",
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-dashboard.init")
            end,
			disable = plugs.ui.dashboard
        }

        use {
            "akinsho/nvim-bufferline.lua",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-bufferline.init")
            end,
			disable = plugs.ui.bufferline
        }

        use {
            "glepnir/galaxyline.nvim",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-galaxyline.lines.bubbles")
            end,
			disable = plugs.ui.galaxyline
        }

        use {
            "kyazdani42/nvim-tree.lua",
            opt = true,
            after = "nvim-web-devicons",
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-nvimtree.init")
            end,
			disable = plugs.ui.nvimtree
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-indentblankline.init")
            end,
			disable = plugs.ui.indent_blankline
        }

        use {
            "mbbill/undotree",
            opt = true,
            keys = "<F5>", -- custome mapping
            config = function()
                require("nd-plugins.nd-undotree.init")
            end,
			disable = plugs.tools.undotree
        }

        use {
            "folke/trouble.nvim",
            opt = true,
            cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"},
			disable = plugs.tools.trouble
        }

        use {
            "preservim/tagbar",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-tagbar.init")
            end,
			disable = plugs.utils.tagbar
        }

        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-gitsigns.init")
            end,
			disable = plugs.lsp.gitsigns
        }

        use {
            "editorconfig/editorconfig-vim",
            opt = true,
            event = "VimEnter",
			disable = plugs.extensions.editorconfig
        }

        --------------------------=== Note taking ===--------------------------
        use {
            "reedes/vim-pencil",
            opt = true,
            cmd = {"Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil"},
			disable = plugs.tools.pencil

        }

        use {
            "folke/todo-comments.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-todocomments.init")
            end,
			disable = plugs.utils.todo_comments
        }

        --------------------------=== Utilities  ===--------------------------

        use {
            "tweekmonster/startuptime.vim",
            opt = true,
            cmd = "StartupTime",
			disable = plugs.utils.startuptime
        }

        use {
            "Pocco81/AutoSave.nvim",
            branch = "dev",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-autosave.init")
            end,
			disable = plugs.utils.autosave
        }

        --------------------------=== Coffee and Chill ===--------------------------

        use {
            "folke/twilight.nvim",
            opt = true,
            keys = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-limelight.init")
            end,
			disable = plugs.ui.twilight
        }

        use {
            "yuttie/comfortable-motion.vim",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-comfortablemotion.init")
            end,
			disable = plugs.utils.comfortable_motion
        }

        use {
            "Pocco81/TrueZen.nvim",
            branch = "dev",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-truezen.init")
            end,
			disable = plugs.utils.truezen
        }

        use {
            "Pocco81/HighStr.nvim",
            branch = "dev",
            opt = true,
            cmd = {"HSHighlight", "HSRmHighlight"},
            keys = {"<F3>", "<F4>"}, -- custome mappings
            config = function()
                require("nd-plugins.nd-highstr.init")
            end,
			disable = plugs.utils.highstr
        }

        use {
            "Asheq/close-buffers.vim",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require("nd-plugins.nd-closebuffers.init")
            end,
			disable = plugs.tools.close_buffers
        }

        --------------------------=== Require The Plugins ===--------------------------

        packer_util.require_plugin("nvim-base16.lua")
    end
)
