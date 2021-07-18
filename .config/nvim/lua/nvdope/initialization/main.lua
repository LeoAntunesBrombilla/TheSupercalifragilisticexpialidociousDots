local execute = vim.api.nvim_command
local fn = vim.fn
local plugs = Cfg.plugins

local ui_path = "nvdope.initialization.ui."
local lsp_path = "nvdope.initialization.lsp."
local debug_path = "nvdope.initialization.debug."
local tools_path = "nvdope.initialization.tools."
local utils_path = "nvdope.initialization.utils."
local extensions_path = "nvdope.initialization.extensions."

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
        ----------------------------=== Debug ===--------------------------
        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-dap.init")
            end
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

        ----------------------------=== UI ===--------------------------
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("nd-plugins.nd-treesitter.init")
            end,
        }

        use {
			"norcalli/nvim-base16.lua",
			opt = true,
			after = "nvim-tree.lua",
			config = function ()
				require("nd-plugins.nd-colorscheme.nd-base16.init")
			end
		}

        use {"kyazdani42/nvim-web-devicons"}

        use {
            "norcalli/nvim-colorizer.lua",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-colorizer.init")
            end
        }

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
            "folke/twilight.nvim",
            opt = true,
            keys = "BufWinEnter",
            config = function()
                require(ui_path .. "twilight.init")
            end,
            disable = plugs.ui.twilight
        }
        ----------------------------=== Tools ===--------------------------
        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-gitsigns.init")
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
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
            },
            cmd = "Telescope",
            config = function()
                require("nd-plugins.nd-telescope.init")
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

        use {
            "sbdchd/neoformat",
            opt = true,
            cmd = "Neoformat"
        }

        use {
            "reedes/vim-pencil",
            opt = true,
            cmd = {"Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil"}
        }

        use {
            "windwp/nvim-autopairs",
            opt = true,
            event = "CursorMoved",
            config = function()
                require("nd-plugins.nd-autopairs.init")
            end
        }

        use {
            "mg979/vim-visual-multi",
            opt = true,
            event = "CursorMoved"
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

        --------------------------=== Utils ===--------------------------

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

        use {
            "preservim/tagbar",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-tagbar.init")
            end
        }

        use {
            "folke/todo-comments.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-todocomments.init")
            end
        }

        use {
            "tpope/vim-commentary",
            opt = true,
            keys = "gc"
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
            end,
			disable = false
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

        ----------------------------=== Extensions ===--------------------------
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
            "editorconfig/editorconfig-vim",
            opt = true,
            event = "VimEnter"
        }
--[[

        ----------------------------=== LSP ===--------------------------
        use {
            "neovim/nvim-lspconfig",
            opt = false,
            requires = {
                {
                    "kabouzeid/nvim-lspinstall",
                    disable = plugs.lsp.lspinstall
                }
            },
            config = function()
                require(lsp_path .. "lsp_install.init")
                require(lsp_path .. "lsp_config.init")
                require(lsp_path .. "lsp_pictograms.init")
            end,
            disable = plugs.lsp.lspconfig
        }

        use {
            "glepnir/lspsaga.nvim",
            opt = true,
            after = "nvim-lspconfig",
            config = function()
                require(lsp_path .. "lsp_saga.init")
            end,
            disable = plugs.lsp.lspsaga
        }

        use {
            "ray-x/lsp_signature.nvim",
            opt = true,
            after = "nvim-lspconfig",
            config = function()
                require(lsp_path .. "lsp_signature.init")
            end,
            disable = plugs.lsp.lspsignature
        }

        ----------------------------=== Debug ===--------------------------
        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "VimEnter",
            config = function()
                require(debug_path .. "dap.init")
            end,
            disable = plugs.debug.dap
        }

        use {
            "Pocco81/DAPInstall",
            branch = "dev",
            opt = true,
            after = "nvim-dap",
            config = function()
                require(debug_path .. "dap_install.init")
            end,
            disable = plugs.debug.dap_install
        }

        ----------------------------=== UI ===--------------------------
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require(ui_path .. "treesitter.init")
            end,
            disable = plugs.ui.treesitter
        }

        use {
            "kyazdani42/nvim-web-devicons",
            disable = plugs.ui.web_devicons
        }

        use {
            "kyazdani42/nvim-tree.lua",
            opt = true,
            after = "nvim-web-devicons",
            event = "BufWinEnter",
            config = function()
                require(ui_path .. "tree.init")
            end,
            disable = plugs.ui.tree
        }

        use {
            "norcalli/nvim-base16.lua",
            opt = true,
            after = "nvim-tree.lua",
            config = function()
                require(ui_path .. "base16.init")
            end,
            disable = plugs.ui.base16
        }

        use {
            "folke/twilight.nvim",
            opt = true,
            keys = "BufWinEnter",
            config = function()
                require(ui_path .. "twilight.init")
            end,
            disable = plugs.ui.twilight
        }

        use {
            "norcalli/nvim-colorizer.lua",
            opt = true,
            event = "BufRead",
            config = function()
                require(ui_path .. "colorizer.init")
            end,
            disable = plugs.ui.colorizer
        }

        use {
            "glepnir/galaxyline.nvim",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require(ui_path .. "galaxyline.lines.bubbles")
            end,
            disable = plugs.ui.galaxyline
        }

        use {
            "akinsho/nvim-bufferline.lua",
            opt = true,
            event = "BufWinEnter",
            config = function()
                require(ui_path .. "bufferline.init")
            end,
            disable = plugs.ui.bufferline
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            opt = true,
            event = "VimEnter",
            config = function()
                require(ui_path .. "indent_blankline.init")
            end,
            disable = plugs.ui.indent_blankline
        }

        use {
            "glepnir/dashboard-nvim",
            opt = true,
            after = "telescope.nvim",
            event = "BufWinEnter",
            config = function()
                require(ui_path .. "dashboard.init")
            end,
            disable = plugs.ui.dashboard
        }

        ----------------------------=== Tools ===--------------------------
        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require(tools_path .. "gitsigns.init")
            end,
            disable = plugs.tools.gitsigns
        }

        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require(tools_path .. "compe.init")
            end,
            disable = plugs.tools.telescope
        }

        use {
            "hrsh7th/vim-vsnip",
            opt = true,
            event = "BufEnter",
            config = function()
                vim.cmd("autocmd FileType * call vsnip#get_complete_items(bufnr())")
				require(tools_path .. "vsnip.init")
            end,
            requires = {
                {"rafamadriz/friendly-snippets", opt = true, disable = plugs.tools.friendly_snippets}
            },
            disable = plugs.tools.vsnip
        }

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"}
            },
            cmd = "Telescope",
            config = function()
                require(tools_path .. "telescope.init")
            end,
            disable = plugs.tools.telescope
        }

        use {
            "Asheq/close-buffers.vim",
            opt = true,
            event = "BufWinEnter",
            disable = plugs.tools.close_buffers
        }

        use {
            "sbdchd/neoformat",
            opt = true,
            cmd = "Neoformat",
            disable = plugs.tools.neoformat
        }

        use {
            "reedes/vim-pencil",
            opt = true,
            cmd = {"Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil"},
            disable = plugs.tools.pencil
        }

        use {
            "windwp/nvim-autopairs",
            opt = true,
            event = "CursorMoved",
            config = function()
                require(tools_path .. "autopairs.init")
            end,
            disable = plugs.tools.autopairs
        }

        use {
            "mg979/vim-visual-multi",
            opt = true,
            event = "CursorMoved",
            disable = plugs.tools.vvm
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
            config = function()
                require(tools_path .. "trouble.init")
            end,
            disable = plugs.tools.trouble
        }
        ----------------------------=== Utils ===--------------------------
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
                require(utils_path .. "autosave.init")
            end,
            disable = plugs.utils.autosave
        }

        use {
            "preservim/tagbar",
            opt = true,
            event = "BufRead",
            config = function()
                require(utils_path .. "tagbar.init")
            end,
            disable = plugs.utils.tagbar
        }

        use {
            "folke/todo-comments.nvim",
            opt = true,
            event = "BufRead",
            config = function()
                require(utils_path .. "todo_comments.init")
            end,
            disable = plugs.utils.todo_comments
        }

        use {
            "tpope/vim-commentary",
            opt = true,
            keys = "gc",
            disable = plugs.utils.commentary
        }

        use {
            "yuttie/comfortable-motion.vim",
            opt = true,
            event = "BufWinEnter",
            disable = plugs.utils.comfortable_motion
        }

        use {
            "Pocco81/TrueZen.nvim",
            branch = "dev",
            opt = true,
            event = "VimEnter",
            config = function()
                require(utils_path .. "truezen.init")
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
                require(utils_path .. "highstr.init")
            end,
            disable = plugs.utils.highstr
        }
        ----------------------------=== Extensions ===--------------------------
        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            ft = {"html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue"},
            config = function()
                require(extensions_path .. "autotag.init")
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
                require(extensions_path .. "yaml.init")
            end,
            disable = plugs.extensions.yaml
        }

        use {
            "fladson/vim-kitty",
            opt = true,
            ft = "kitty",
            disable = plugs.extensions.kitty
        }

        use {
            "editorconfig/editorconfig-vim",
            opt = true,
            event = "VimEnter",
            disable = plugs.extensions.editorconfig
        }
		
--]]

    end
)
