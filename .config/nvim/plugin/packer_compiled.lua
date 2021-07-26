-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
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
  ["Base16.nvim"] = {
    after = { "galaxyline.nvim", "nvim-bufferline.lua", "nvim-web-devicons" },
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvdope.initialization.ui.base16\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/Base16.nvim"
  },
  ["HighStr.nvim"] = {
    commands = { "HSHighlight", "HSRmHighlight" },
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.utils.highstr\frequire\0" },
    keys = { { "", "<F3>" }, { "", "<F4>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/HighStr.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.tools.luasnip\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.utils.truezen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["close-buffers.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/close-buffers.vim"
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
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2C\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0(nvdope.initialization.ui.galaxyline\frequire\0" },
    load_after = {
      ["Base16.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
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
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
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
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    load_after = {
      ["Base16.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'nvdope.initialization.ui.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after = { "nvim-autopairs" },
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvdope.initialization.tools.compe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-compe",
    wants = { "LuaSnip" }
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
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
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
    config = { "\27LJ\1\2E\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0*nvdope.initialization.ui.web_devicons\frequire\0" },
    load_after = {
      ["Base16.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    after = { "Base16.nvim" },
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
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\1\2E\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0*nvdope.initialization.tools.telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvdope.initialization.ui.twilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  ["vim-commentary"] = {
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-commentary"
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
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'nvdope.initialization.ui.dashboard\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2I\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0.nvdope.initialization.ui.indent_blankline\frequire\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":TZAtaraxis") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Telescope") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope-fzf-native.nvim', 'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SoftPencil") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SoftPencil lua require("packer.load")({'vim-pencil'}, { cmd = "SoftPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":HardPencil") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file HardPencil lua require("packer.load")({'vim-pencil'}, { cmd = "HardPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Twilight") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TZMinimalist") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":HSHighlight") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file HSHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":HSRmHighlight") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file HSRmHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSRmHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TZFocus") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Pencil") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Pencil lua require("packer.load")({'vim-pencil'}, { cmd = "Pencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Neoformat") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":StartupTime") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TogglePencil") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TogglePencil lua require("packer.load")({'vim-pencil'}, { cmd = "TogglePencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TwilightEnable") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TwilightDisable") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TwilightDisable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NoPencil") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NoPencil lua require("packer.load")({'vim-pencil'}, { cmd = "NoPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <F4> <cmd>lua require("packer.load")({'HighStr.nvim'}, { keys = "<lt>F4>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F3> <cmd>lua require("packer.load")({'HighStr.nvim'}, { keys = "<lt>F3>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lua-dev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'vim-visual-multi'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'AutoSave.nvim', 'indent-blankline.nvim', 'lspkind-nvim', 'editorconfig-vim', 'lspsaga.nvim', 'nvim-colorizer.lua', 'close-buffers.vim', 'plenary.nvim', 'nvim-lspinstall'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'LuaSnip', 'friendly-snippets'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'neoscroll.nvim'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
