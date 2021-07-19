local present, _ = pcall(require, "packerInit")

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {"wbthomason/packer.nvim", event = "VimEnter"}

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
            "nvim-telescope/telescope-media-files.nvim",
            cmd = "Telescope"
        }

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
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function()
                require("plugins.others").comment()
            end
        }

        use {
            "glepnir/dashboard-nvim",
            event = "BufWinEnter",
            setup = function()
                require "plugins.dashboard"
            end
        }

        use {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime"
        }

        use {
            "Pocco81/AutoSave.nvim",
            branch = "dev",
            event = "BufRead",
            config = function()
                require "plugins.autosave"
            end
        }

        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("plugins.others").neoscroll()
            end
        }

        use {
            "Pocco81/TrueZen.nvim",
            branch = "dev",
            cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
            config = function()
                require "plugins.zenmode"
            end
        }

        use {
            "Pocco81/HighStr.nvim",
            branch = "dev",
            cmd = {"HSHighlight", "HSRmHighlight"},
            keys = {"<F3>", "<F4>"}, -- custome mappings
            config = function()
                require "plugins.highstr"
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
            event = "BufRead"
        }
    end
)
