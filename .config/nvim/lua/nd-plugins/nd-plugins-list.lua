local execute = vim.api.nvim_command
local fn = vim.fn

-- vim._update_package_paths()

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
        use {"nvim-telescope/telescope.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true} -- major dependency

        ----------------------------=== LSP ===--------------------------

        use {
            "neovim/nvim-lspconfig",
            opt = true,
            event = "BufRead"
        }
        use {"glepnir/lspsaga.nvim", opt = true}
        use {"kabouzeid/nvim-lspinstall", opt = true}
        use {"onsails/lspkind-nvim", opt = true}
        use {
            "weilbith/nvim-floating-tag-preview",
            cmd = {"Ptag", "Ptselect", "Ptjump", "Psearch", "Pedit"},
            opt = true
        }

        -- Autocomplete
        use {
            "hrsh7th/nvim-compe",
            -- opt = true,
            event = "InsertEnter",
            config = function()
                require("nd-plugins.nd-compe.init")

                -- don't lazy load it or else experience at startup will be a pain in the a$$
                -- require('nd-plugins.nd-vsnip.init')
            end
        }
        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            ft = {"html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue"},
            config = function()
                require("nd-plugins.nd-autotag.init")
            end
        }
        use {"hrsh7th/vim-vsnip", opt = true}
        use {"rafamadriz/friendly-snippets", opt = true}
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
            config = function()
                require("nd-plugins.nd-dap.init")
            end
        }
        use {"nvim-telescope/telescope-dap.nvim", opt = true}
        use {
            "Pocco81/DAPInstall",
            branch = "dev",
            opt = true,
            config = function()
                require("nd-plugins.nd-dapinstall.init")
            end
        }
        use {"jbyuki/one-small-step-for-vimkind", opt = true}
        use {
            "mfussenegger/nvim-dap-python",
            opt = true,
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

        -- Icons
        use {
            "kyazdani42/nvim-web-devicons",
            opt = true
        }

        -- Colors!
        use {
            "norcalli/nvim-colorizer.lua",
            opt = true,
            cmd = "ColorizerToggle"
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
            opt = true
        }

        --------------------------=== Lang support ===--------------------------

        use {
            "simrat39/rust-tools.nvim",
            opt = true,
            ft = "rust"
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
            ft = {"yaml"},
            config = function()
                require("yaml_nvim").init()
            end
        }

        --------------------------=== Project/Code Navigation ===--------------------------

        use {"ChristianChiarulli/dashboard-nvim", opt = true}
        use {"akinsho/nvim-bufferline.lua", opt = true}
        use {"glepnir/galaxyline.nvim", opt = true}
        use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
        use {
            "lukas-reineke/indent-blankline.nvim",
            branch = "lua",
            opt = true,
            event = "VimEnter",
            config = function()
                require("nd-plugins.nd-indentblankline.init")
            end
        } -- Indent guides for Neovim
        use {
            "mbbill/undotree",
            opt = true,
            keys = "<F5>", -- custome mapping
            config = function()
                require("nd-plugins.nd-undotree.init")
            end
        }
        use {
            "kosayoda/nvim-lightbulb",
            opt = true,
            config = function()
                require("nd-plugins.nd-lightbulb.init")
            end
        }
        use {"folke/lsp-colors.nvim", opt = true}
        use {
            "folke/trouble.nvim",
            opt = true,
            cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"}
        }
        use {"kyazdani42/nvim-tree.lua", opt = true}
        use "kevinhwang91/rnvimr"
        use {"kevinhwang91/nvim-bqf", opt = true}
        use {
            "preservim/tagbar",
            opt = true,
            event = "BufRead",
            config = function()
                require("nd-plugins.nd-tagbar.init")
            end
        }
        use {"lewis6991/gitsigns.nvim", opt = true}
        use {"editorconfig/editorconfig-vim", opt = true}

        --------------------------=== Note taking ===--------------------------
        use {
            "reedes/vim-pencil",
            opt = true,
            cmd = {"Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil"}
        }

        --------------------------=== Extra ===--------------------------

        use {
            "tweekmonster/startuptime.vim",
            opt = true,
            cmd = "StartupTime"
        }
        use {
            "vim-utils/vim-man",
            opt = true,
            cmd = "Man"
        }
        use {"907th/vim-auto-save", opt = true}

        --------------------------=== Coffee and Chill ===--------------------------

        use {
            "junegunn/limelight.vim",
            opt = true,
            keys = "<leader>ll",
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
            branch = "dev-mode-ataraxis",
            opt = true
        }
        use {
            "Pocco81/NoCLC.nvim",
            branch = "dev",
            config = function()
                require("nd-plugins.nd-noclc.init")
            end
        }
        use {
            "Pocco81/HighStr.nvim",
            branch = "dev",
            opt = true,
            cmd = {"HSHighlight", "HSRmHighlight"},
            keys = {"<F3>", "<F4>"}, -- custome mapping
            config = function()
                require("nd-plugins.nd-highstr.init")
            end
        }
        use {"Asheq/close-buffers.vim", opt = true}

        --------------------------=== Require The Plugins ===--------------------------

        --------=== (Require) Major Dependencies
        require_plugin("plenary.nvim")
        require_plugin("telescope.nvim")
        require_plugin("popup.nvim")

        --------=== (Require) LSP
        require_plugin("nvim-lspconfig")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-lspinstall")
        require_plugin("lspkind-nvim")
        -- require_plugin("nvim-floating-tag-preview")
        -- require_plugin("rest.nvim")
        -- require_plugin("nvim-compe")
        -- require_plugin("vim-closetag")
        require_plugin("snippets.nvim")
        require_plugin("vim-vsnip")
        require_plugin("friendly-snippets")
        -- require_plugin("nvim-autopairs")

        --------=== (Require) Debugging
        require_plugin("nvim-dap")
        require_plugin("telescope-dap.nvim")
        -- require_plugin("nvim-dap-virtual-text")
        require_plugin("mfussenegger/nvim-dap-python")
        require_plugin("one-small-step-for-vimkind")

        --------=== (Require) Syntax
        require_plugin("nvim-treesitter")
        require_plugin("nvim-base16.lua")
        -- require_plugin("nvim-ts-autotag")

        --------=== (Require) Personalization
        require_plugin("nvim-web-devicons")
        require_plugin("nvim-colorizer.lua")

        --------=== (Require) Text Manipulation
        -- require_plugin("vim-visual-multi")
        require_plugin("neoformat")

        --------=== (Require) Lang support
        -- require_plugin("rust-tools.nvim")
        -- require_plugin("lua-dev.nvim")
        -- require_plugin("nvim-jdtls")
        -- require_plugin("yaml.nvim")

        --------=== (Require) Project/Code Navigation
        require_plugin("dashboard-nvim")
        require_plugin("nvim-bufferline.lua")
        require_plugin("galaxyline.nvim")
        -- require_plugin("indent-blankline.nvim")
        -- require_plugin("undotree")
        -- require_plugin("nvim-lightbulb")
        require_plugin("lsp-colors.nvim")
        -- require_plugin("trouble.nvim")
        require_plugin("nvim-tree.lua")
        require_plugin("nvim-bqf")
        require_plugin("gitsigns.nvim")
        require_plugin("editorconfig-vim")
        require_plugin("telescope-fzy-native")
        -- require_plugin("tagbar")

        --------=== (Require) Note Taking
        -- require_plugin("vim-pencil")

        --------=== (Require) Extra
        require_plugin("startuptime.vim")
        require_plugin("vim-auto-save")
        -- require_plugin("vim-man")

        --------=== (Require) Coffee and Chill
        -- require_plugin("limelight.vim")
        -- require_plugin("comfortable-motion.vim")
        require_plugin("TrueZen.nvim")
        require_plugin("DAPInstall.nvim")
        -- require_plugin("HighStr.nvim")
        -- require_plugin("NoCLC.nvim")
        require_plugin("close-buffers.vim")
        require_plugin("nvim-bufferline.lua")
    end
)
