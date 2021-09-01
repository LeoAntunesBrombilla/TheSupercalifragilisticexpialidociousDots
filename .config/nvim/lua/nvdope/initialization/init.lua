local present, packer = pcall(require, "nvdope.initialization.packer_init")

if not present then
	return false
end

local use = packer.use
require("impatient")

return packer.startup(function()
	use({
		"lewis6991/impatient.nvim",
		rocks = "mpack",
	})

	use({
		"nvim-lua/plenary.nvim",
	})

	use({ "wbthomason/packer.nvim", event = "VimEnter" })

	----------------------------=== UI ===---------------------------
	use({
		"Pocco81/Catppuccino.nvim",
		branch = "dev",
		after = "bufferline.nvim", -- becuase catppuccino overrides highlights and not the other way around
		config = function()
			require("nvdope.initialization.ui.catppuccino")
		end,
		disable = Cfg.plugins.ui.base16,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		after = "packer.nvim",
		config = function()
			require("nvdope.initialization.ui.web_devicons")
		end,
		disable = Cfg.plugins.ui.web_devicons,
	})

	use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("nvdope.initialization.ui.bufferline")
		end,
		disable = Cfg.plugins.ui.bufferline,
	})

	use({
		"famiu/feline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("nvdope.initialization.ui.feline")
		end,
		disable = Cfg.plugins.ui.feline,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			require("nvdope.initialization.ui.indent_blankline")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("nvdope.initialization.ui.colorizer")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("nvdope.initialization.ui.treesitter")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("nvdope.initialization.ui.tree")
		end,
		disable = Cfg.plugins.ui.tree,
	})

	use({
		"lewis6991/gitsigns.nvim",
		after = "plenary.nvim",
		config = function()
			require("nvdope.initialization.tools.gitsigns")
		end,
		disable = Cfg.plugins.tools.gitsigns,
	})

	use({
		"glepnir/dashboard-nvim",
		event = "BufWinEnter",
		setup = function()
			require("nvdope.initialization.ui.dashboard")
		end,
		disable = Cfg.plugins.ui.dashboard,
	})

	use({
		"folke/twilight.nvim",
		opt = true,
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function()
			require("nvdope.initialization.ui.twilight")
		end,
		disable = Cfg.plugins.ui.twilight,
	})

	----------------------------=== LSP ===--------------------------
	use({
		"kabouzeid/nvim-lspinstall",
		after = "Catppuccino.nvim",
		disable = Cfg.plugins.lsp.lspinstall,
	})

	use({
		"neovim/nvim-lspconfig",
		after = "nvim-lspinstall",
		config = function()
			require("nvdope.initialization.lsp.lspconfig")
		end,
		disable = Cfg.plugins.lsp.lspconfig,
	})

	use({
		"onsails/lspkind-nvim",
		event = "BufRead",
		config = function()
			require("nvdope.initialization.lsp.lspkind")
		end,
		disable = Cfg.plugins.lsp.lspkind,
	})

	use({
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("nvdope.initialization.lsp.lspsaga")
		end,
		disable = Cfg.plugins.lsp.lspsaga,
	})

	use({
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		commit = "4f9fadffe1dea21cd465f5acbf00f702fca5580b",
		config = function()
			require("nvdope.initialization.lsp.lspsignature")
		end,
		disable = Cfg.plugins.lsp.lspsignature,
	})

	----------------------------=== Tools ===------------------------

	use({
		"hrsh7th/nvim-cmp",
		event = "VimEnter",
		setup = function()
			vim.cmd([[set nolist]])
		end,
		config = function()
			require("nvdope.initialization.tools.cmp")
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("nvdope.initialization.tools.luasnip")
		end,
	})

	use({
		"saadparwaiz1/cmp_luasnip",
		after = "LuaSnip",
	})

	use({
		"hrsh7th/cmp-nvim-lua",
		after = "cmp_luasnip",
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
		after = "cmp-nvim-lua",
	})

	use({
		"hrsh7th/cmp-buffer",
		after = "cmp-nvim-lsp",
	})

	use({
		"rafamadriz/friendly-snippets",
		after = "cmp-buffer",
	})

	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("nvdope.initialization.tools.autopairs")
		end,
	})

	use({
		"sbdchd/neoformat",
		cmd = "Neoformat",
		disable = Cfg.plugins.tools.neoformat,
	})

	use({
		"nvim-lua/popup.nvim",
		after = "plenary.nvim",
		disable = Cfg.plugins.tools.popup,
	})

	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("nvdope.initialization.tools.telescope")
		end,
		disable = Cfg.plugins.tools.telescope,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end,
		disable = Cfg.plugins.tools.telescope,
	})

	use({
		"andymass/vim-matchup",
		opt = true,
		setup = function()
			require("nvdope.utils.packer").lazy_load("vim-matchup")
		end,
	})

	use({
		"Asheq/close-buffers.vim",
		opt = true,
		event = "BufRead",
		disable = Cfg.plugins.tools.close_buffers,
	})

	use({
		"reedes/vim-pencil",
		opt = true,
		cmd = { "Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil" },
		disable = Cfg.plugins.tools.pencil,
	})

	use({
		"mg979/vim-visual-multi",
		opt = true,
		event = "CursorMoved",
		disable = Cfg.plugins.tools.vvm,
	})

	----------------------------=== Utils ===-------------------------

	use({
		"Pocco81/AutoSave.nvim",
		branch = "dev",
		event = "BufRead",
		config = function()
			require("nvdope.initialization.utils.autosave")
		end,
		disable = Cfg.plugins.utils.autosave,
	})

	use({
		"akinsho/nvim-toggleterm.lua",
		event = "BufRead",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use({
		"tpope/vim-commentary",
		opt = true,
		keys = "gc",
		disable = Cfg.plugins.utils.commentary,
	})

	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("nvdope.initialization.utils.neoscroll")
		end,
		disable = Cfg.plugins.utils.neoscroll,
	})

	use({
		"Pocco81/TrueZen.nvim",
		branch = "dev",
		cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
		config = function()
			require("nvdope.initialization.utils.truezen")
		end,
		disable = Cfg.plugins.utils.truezen,
	})

	use({
		"Pocco81/HighStr.nvim",
		branch = "dev",
		cmd = { "HSHighlight", "HSRmHighlight", "HSImport", "HSExport" },
		keys = { "<F3>", "<F4>" }, -- custome mappings
		config = function()
			require("nvdope.initialization.utils.highstr")
		end,
		disable = Cfg.plugins.utils.highstr,
	})

	use({
		"folke/todo-comments.nvim",
		after = "Catppuccino.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("nvdope.initialization.utils.todocomments")
		end,
		disable = Cfg.plugins.utils.todocomments,
	})

	use({
		"kvngvikram/rightclick-macros",
		event = "VimEnter",
	})

	----------------------------=== Extensions ===--------------------------
	use({
		"folke/lua-dev.nvim",
		opt = true,
		ft = "lua",
		disable = Cfg.plugins.extensions.lua_dev,
	})

	use({
		"simrat39/rust-tools.nvim",
		opt = true,
		ft = "rust",
		disable = Cfg.plugins.extensions.rust_tools,
	})

	use({
		"fladson/vim-kitty",
		opt = true,
		ft = "kitty",
		disable = Cfg.plugins.extensions.kitty,
	})

	use({
		"ray-x/go.nvim",
		opt = true,
		ft = "go",
		config = function()
			require("go").setup()
		end,
		disable = Cfg.plugins.extensions.go,
	})

	use({
		"windwp/nvim-ts-autotag",
		opt = true,
		ft = { "html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		config = function()
			require("nvdope.initialization.extensions.ts_autotag")
		end,
		disable = Cfg.plugins.extensions.ts_autotag,
	})

	use({
		"editorconfig/editorconfig-vim",
		opt = true,
		event = "BufRead",
		disable = Cfg.plugins.extensions.editorconfig,
	})
end)
