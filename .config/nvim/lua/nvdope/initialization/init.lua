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

        ----------------------------=== UI ===---------------------------
        use {
            "akinsho/nvim-bufferline.lua",
            after = "nvim-base16.lua",
            disable = Cfg.plugins.ui.bufferline
        }

        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.statusline"
            end,
            disable = Cfg.plugins.ui.galaxyline
        }

        use {
            "siduck76/nvim-base16.lua",
            after = "packer.nvim",
            config = function()
                require "theme"
            end,
            disable = Cfg.plugins.ui.base16
        }

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("plugins.others").colorizer()
            end,
            disable = Cfg.plugins.ui.colorizer
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require "plugins.treesitter"
            end,
            disable = Cfg.plugins.ui.treesitter
        }

        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require "plugins.nvimtree"
            end,
            disable = Cfg.plugins.ui.tree
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.icons"
            end,
            disable = Cfg.plugins.ui.web_devicons
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("plugins.others").blankline()
            end,
            disable = Cfg.plugins.ui.indent_blankline
        }

        use {
            "glepnir/dashboard-nvim",
            event = "BufWinEnter",
            setup = function()
                require "plugins.dashboard"
            end,
            disable = Cfg.plugins.ui.dashboard
        }

        use {
            "folke/twilight.nvim",
            opt = true,
            cmd = {"Twilight", "TwilightEnable", "TwilightDisable"},
            disable = Cfg.plugins.ui.twilight
        }

        ----------------------------=== LSP ===--------------------------
        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead",
            disable = Cfg.plugins.lsp.lspinstall
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugins.lspconfig"
            end,
            disable = Cfg.plugins.lsp.lspconfig
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("plugins.others").lspkind()
            end,
            disable = Cfg.plugins.lsp.lspkind
        }

        ----------------------------=== Tools ===------------------------
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
                    end,
                    disable = Cfg.plugins.tools.luasnip
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre",
                    disable = Cfg.plugins.tools.friendly_snippets
                }
            },
            disable = Cfg.plugins.tools.compe
        }

        use {
            "sbdchd/neoformat",
            cmd = "Neoformat",
            disable = Cfg.plugins.tools.neoformat
        }

        use {
            "nvim-lua/plenary.nvim",
            event = "BufRead",
            disable = Cfg.plugins.tools.plenary
        }

        use {
            "nvim-lua/popup.nvim",
            after = "plenary.nvim",
            disable = Cfg.plugins.tools.popup
        }

        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = function()
                require "plugins.telescope"
            end,
            disable = Cfg.plugins.tools.telescope
        }

        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            cmd = "Telescope",
            disable = Cfg.plugins.tools.telescope
        }

        use {
            "lewis6991/gitsigns.nvim",
            after = "plenary.nvim",
            config = function()
                require "plugins.gitsigns"
            end,
            disable = Cfg.plugins.tools.gitsigns
        }

        use {
            "windwp/nvim-autopairs",
            after = "nvim-compe",
            config = function()
                require "plugins.autopairs"
            end,
            disable = Cfg.plugins.tools.autopairs
        }

        use {
            "andymass/vim-matchup",
            event = "CursorMoved",
            disable = Cfg.plugins.tools.matchup
        }

        use {
            "Asheq/close-buffers.vim",
            opt = true,
            event = "BufRead",
            disable = Cfg.plugins.tools.close_buffers
        }

        use {
            "reedes/vim-pencil",
            opt = true,
            cmd = {"Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil"},
            disable = Cfg.plugins.tools.pencil
        }

        ----------------------------=== Debug ===--------------------------
        use {
            "mfussenegger/nvim-dap",
            opt = true,
            event = "VimEnter",
            config = function()
                -- require("nd-plugins.nd-dap.init")
            end,
            disable = Cfg.plugins.debug.dap
        }

        use {
            "Pocco81/DAPInstall",
            branch = "dev",
            opt = true,
            after = "nvim-dap",
            config = function()
                -- require("nd-plugins.nd-dapinstall.init")
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
				require("nvdope.initialization.utils.autosave")
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
				require("nvdope.initialization.utils.neoscroll")
            end,
            disable = Cfg.plugins.utils.neoscroll
        }

        use {
            "Pocco81/TrueZen.nvim",
            branch = "dev",
            cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
            config = function()
				require("nvdope.initialization.utils.truezen")
            end,
            disable = Cfg.plugins.utils.truezen
        }

        use {
            "Pocco81/HighStr.nvim",
            branch = "dev",
            cmd = {"HSHighlight", "HSRmHighlight"},
            keys = {"<F3>", "<F4>"}, -- custome mappings
            config = function()
				require("nvdope.initialization.utils.highstr")
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
            config = function()
				require("nvdope.initialization.extensions.ts_autotag")
            end,
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
