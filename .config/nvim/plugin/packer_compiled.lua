-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sebas5758/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/sebas5758/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/sebas5758/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/sebas5758/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sebas5758/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "\27LJ\1\2D\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0)nvdope.initialization.utils.autosave\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/AutoSave.nvim"
  },
  ["Catppuccino.nvim"] = {
    after = { "indent-blankline.nvim", "hop.nvim", "trouble.nvim", "todo-comments.nvim", "nvim-lspinstall" },
    config = { "\27LJ\1\2D\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0)nvdope.initialization.ui.catppuccino\frequire\0" },
    load_after = {
      ["bufferline.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/Catppuccino.nvim"
  },
  ["DAPInstall.nvim"] = {
    config = { "\27LJ\1\2u\0\0\3\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\1G\0\1\0\1\0\2\29verbosely_call_debuggers\1\22installation_path\r~/Music/\nsetup\16dap-install\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim"
  },
  ["HighStr.nvim"] = {
    commands = { "HSHighlight", "HSRmHighlight", "HSImport", "HSExport" },
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.utils.highstr\frequire\0" },
    keys = { { "", "<F3>" }, { "", "<F4>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/HighStr.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.tools.luasnip\frequire\0" },
    loaded = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.utils.truezen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["bufferline.nvim"] = {
    after = { "Catppuccino.nvim" },
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.ui.bufferline\frequire\0" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/bufferline.nvim"
  },
  ["close-buffers.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/close-buffers.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/editorconfig-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvdope.initialization.ui.feline\frequire\0" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2D\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0)nvdope.initialization.tools.gitsigns\frequire\0" },
    load_after = {
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    load_after = {
      ["Catppuccino.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    load_after = {
      ["Catppuccino.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\1\2F\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0+nvdope.initialization.lsp.lspsignature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvdope.initialization.lsp.lspkind\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvdope.initialization.lsp.lspsaga\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/neoformat"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\2E\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0*nvdope.initialization.utils.neoscroll\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2E\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0*nvdope.initialization.tools.autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "nvim-autopairs", "cmp-calc", "cmp-nvim-lua", "cmp-emoji", "cmp-buffer", "cmp-path", "cmp_luasnip" },
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvdope.initialization.tools.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'nvdope.initialization.ui.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "DAPInstall.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.lsp.lspconfig\frequire\0" },
    load_after = {
      ["nvim-lspinstall"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    after = { "nvim-lspconfig" },
    load_after = {
      ["Catppuccino.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nvdope.initialization.ui.tree\frequire\0' },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.ui.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    after = { "bufferline.nvim", "feline.nvim" },
    config = { "\27LJ\1\2E\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0*nvdope.initialization.ui.web_devicons\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    after = { "nvim-web-devicons" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    after = { "gitsigns.nvim", "popup.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["rightclick-macros"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/rightclick-macros"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-native.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\1\2E\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0*nvdope.initialization.tools.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2H\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0-nvdope.initialization.utils.todocomments\frequire\0" },
    load_after = {
      ["Catppuccino.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.utils.trouble\frequire\0" },
    load_after = {
      ["Catppuccino.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvdope.initialization.ui.twilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-commentary"] = {
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-kitty"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty"
  },
  ["vim-matchup"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-pencil"] = {
    commands = { "Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-pencil"
  },
  ["vim-visual-multi"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\16vim-matchup\14lazy_load\24nvdope.utils.packer\frequire\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2I\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0.nvdope.initialization.ui.indent_blankline\frequire\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'nvdope.initialization.ui.dashboard\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.tools.luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SoftPencil lua require("packer.load")({'vim-pencil'}, { cmd = "SoftPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HardPencil lua require("packer.load")({'vim-pencil'}, { cmd = "HardPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSImport lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSImport", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSRmHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSRmHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSExport lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSExport", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Pencil lua require("packer.load")({'vim-pencil'}, { cmd = "Pencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TogglePencil lua require("packer.load")({'vim-pencil'}, { cmd = "TogglePencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightDisable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NoPencil lua require("packer.load")({'vim-pencil'}, { cmd = "NoPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <F4> <cmd>lua require("packer.load")({'HighStr.nvim'}, { keys = "<lt>F4>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F3> <cmd>lua require("packer.load")({'HighStr.nvim'}, { keys = "<lt>F3>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType kitty ++once lua require("packer.load")({'vim-kitty'}, { ft = "kitty" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lua-dev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-visual-multi'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'lsp_signature.nvim', 'nvim-treesitter', 'AutoSave.nvim', 'nvim-toggleterm.lua', 'lspkind-nvim', 'close-buffers.vim', 'lspsaga.nvim', 'nvim-colorizer.lua', 'editorconfig-vim', 'plenary.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'neoscroll.nvim'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'rightclick-macros', 'nvim-dap', 'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]], true)
vim.cmd [[source /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]]
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
