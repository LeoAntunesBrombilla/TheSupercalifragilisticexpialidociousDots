local present, _ = pcall(require, "nvdope.initialization.packer_init")

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {"wbthomason/packer.nvim", event = "VimEnter"}

		----------------------------=== LSP ===--------------------------
		----------------------------=== Debug ===------------------------
		----------------------------=== UI ===---------------------------
		----------------------------=== Tools ===------------------------

        use {"akinsho/nvim-bufferline.lua", after = "nvim-base16.lua"}

        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.statusline"
            end
        }

        use {
            "siduck76/nvim-base16.lua",
            after = "packer.nvim",
            config = function()
                require "theme"
            end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("plugins.others").colorizer()
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require "plugins.treesitter"
            end
        }

        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead"
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugins.lspconfig"
            end
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("plugins.others").lspkind()
            end
        }

        -- load compe in insert mode only
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require "plugins.compe"
            end,
            wants = {"LuaSnip"},
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require "plugins.luasnip"
                    end
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre"
                }
            }
        }

        use {"sbdchd/neoformat", cmd = "Neoformat"}

        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require "plugins.nvimtree"
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.icons"
            end
        }

        use {"nvim-lua/plenary.nvim", event = "BufRead"}
        use {"nvim-lua/popup.nvim", after = "plenary.nvim"}

        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = function()
                require "plugins.telescope"
            end
        }

        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope"}

        use {
            "lewis6991/gitsigns.nvim",
            after = "plenary.nvim",
            config = function()
                require "plugins.gitsigns"
            end
        }

        use {
            "windwp/nvim-autopairs",
            after = "nvim-compe",
            config = function()
                require "plugins.autopairs"
            end
        }

        use {"andymass/vim-matchup", event = "CursorMoved"}

        use {
            "glepnir/dashboard-nvim",
            event = "BufWinEnter",
            setup = function()
                require "plugins.dashboard"
            end
        }




        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("plugins.others").blankline()
            end
        }

        use {
            "Asheq/close-buffers.vim",
            opt = true,
            event = "BufRead"
        }

		----------------------------=== Debug ===--------------------------
        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-dap.init")
            end,
			disable = Cfg.plugins.debug.dap
        }

        use {
            "Pocco81/DAPInstall",
            branch = "dev",
            opt = true,
            after = "nvim-dap",
            config = function()
                require("nd-plugins.nd-dapinstall.init")
            end,
			disable = Cfg.plugins.debug.dap_install
        }

		----------------------------=== Utils ===-------------------------
        use {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime",
			disable = Cfg.plugins.utils.startuptime
        }

        use {
            "Pocco81/AutoSave.nvim",
            branch = "dev",
            event = "BufRead",
            config = function()
                require "plugins.autosave"
            end,
			disable = Cfg.plugins.utils.autosave
        }

		use {
            "tpope/vim-commentary",
            opt = true,
            keys = "gc",
			disable = Cfg.plugins.utils.commentary
        }

        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("plugins.others").neoscroll()
            end,
			disable = Cfg.plugins.utils.neoscroll
        }

        use {
            "Pocco81/TrueZen.nvim",
            branch = "dev",
            cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
            config = function()
                require "plugins.zenmode"
            end,
			disable = Cfg.plugins.utils.truezen
        }

        use {
            "Pocco81/HighStr.nvim",
            branch = "dev",
            cmd = {"HSHighlight", "HSRmHighlight"},
            keys = {"<F3>", "<F4>"}, -- custome mappings
            config = function()
                require "plugins.highstr"
            end,
			disable = Cfg.plugins.utils.highstr
        }


        ----------------------------=== Extensions ===--------------------------
        use {
            "folke/lua-dev.nvim",
            opt = true,
            ft = "lua",
			disable = Cfg.plugins.extensions.lua_dev
        }

        use {
            "simrat39/rust-tools.nvim",
            opt = true,
            ft = "rust",
			disable = Cfg.plugins.extensions.rust_tools
        }

        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            ft = {"html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue"},
            -- config = function()
            --     require("nd-plugins.nd-autotag.init")
            -- end,
			disable = Cfg.plugins.extensions.ts_autotag
        }

        use {
            "editorconfig/editorconfig-vim",
            opt = true,
            event = "BufRead",
			disable = Cfg.plugins.extensions.editorconfig
        }
    end
)
