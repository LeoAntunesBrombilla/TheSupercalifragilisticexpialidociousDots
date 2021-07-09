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
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 nd-plugins.nd-autosave.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/AutoSave.nvim"
  },
  DAPInstall = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nd-plugins.nd-dapinstall.init\frequire\0' },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/DAPInstall"
  },
  ["HighStr.nvim"] = {
    commands = { "HSHighlight", "HSRmHighlight" },
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31nd-plugins.nd-highstr.init\frequire\0" },
    keys = { { "", "<F3>" }, { "", "<F4>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/HighStr.nvim"
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31nd-plugins.nd-truezen.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["close-buffers.vim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nd-plugins.nd-closebuffers.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/close-buffers.vim"
  },
  ["comfortable-motion.vim"] = {
    config = { "\27LJ\1\2D\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0)nd-plugins.nd-comfortablemotion.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/comfortable-motion.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-dashboard.init\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
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
    load_after = {
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2F\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0+nd-plugins.nd-galaxyline.lines.bubbles\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 nd-plugins.nd-gitsigns.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2B\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0'nd-plugins.nd-indentblankline.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["limelight.vim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-limelight.init\frequire\0" },
    keys = { { "", "BufWinEnter" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-lspcolors.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
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
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-autopairs.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-base16.lua"
  },
  ["nvim-bufferline.lua"] = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nd-plugins.nd-bufferline.init\frequire\0' },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-colorizer.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29nd-plugins.nd-compe.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-python", "DAPInstall", "telescope-dap.nvim", "one-small-step-for-vimkind" },
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27nd-plugins.nd-dap.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-dap-python"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-dap-python"
  },
  ["nvim-jdtls"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-jdtls"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-lightbulb.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 nd-plugins.nd-nvimtree.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nd-plugins.nd-treesitter.init\frequire\0' },
    loaded = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31nd-plugins.nd-autotag.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  tagbar = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30nd-plugins.nd-tagbar.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/tagbar"
  },
  ["telescope-dap.nvim"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    after = { "dashboard-nvim" },
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nd-plugins.nd-telescope.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nd-plugins.nd-todocomments.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  undotree = {
    config = { "\27LJ\1\2;\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0 nd-plugins.nd-undotree.init\frequire\0" },
    keys = { { "", "<F5>" } },
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
  ["vim-elixir"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-elixir"
  },
  ["vim-kitty"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty"
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
  },
  ["vim-vsnip"] = {
    after = { "friendly-snippets" },
    config = { "\27LJ\1\2Š\1\0\0\2\0\5\0\b4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\3\0%\1\4\0>\0\2\1G\0\1\0\29nd-plugins.nd-vsnip.init\frequire>autocmd FileType * call vsnip#get_complete_items(bufnr())\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  vimtex = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30nd-plugins.nd-vimtex.init\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["yaml.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tinit\14yaml_nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/sebas5758/.local/share/nvim/site/pack/packer/opt/yaml.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring('\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nd-plugins.nd-treesitter.init\frequire\0', "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file HSHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SoftPencil lua require("packer.load")({'vim-pencil'}, { cmd = "SoftPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file HardPencil lua require("packer.load")({'vim-pencil'}, { cmd = "HardPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Pencil lua require("packer.load")({'vim-pencil'}, { cmd = "Pencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleClose lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TogglePencil lua require("packer.load")({'vim-pencil'}, { cmd = "TogglePencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file HSRmHighlight lua require("packer.load")({'HighStr.nvim'}, { cmd = "HSRmHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NoPencil lua require("packer.load")({'vim-pencil'}, { cmd = "NoPencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <F5> <cmd>lua require("packer.load")({'undotree'}, { keys = "<lt>F5>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F4> <cmd>lua require("packer.load")({'HighStr.nvim'}, { keys = "<lt>F4>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F3> <cmd>lua require("packer.load")({'HighStr.nvim'}, { keys = "<lt>F3>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> BufWinEnter <cmd>lua require("packer.load")({'limelight.vim'}, { keys = "BufWinEnter", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType euphoria3 ++once lua require("packer.load")({'vim-elixir'}, { ft = "euphoria3" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-dap-python'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lua-dev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType phtml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "phtml" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType kitty ++once lua require("packer.load")({'vim-kitty'}, { ft = "kitty" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "eelixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType xhtml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "xhtml" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'yaml.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'nvim-autopairs', 'vim-visual-multi'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'tagbar', 'gitsigns.nvim', 'nvim-colorizer.lua', 'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'TrueZen.nvim', 'nvim-tree.lua', 'dashboard-nvim', 'close-buffers.vim', 'nvim-bufferline.lua', 'galaxyline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'lsp-colors.nvim', 'indent-blankline.nvim', 'nvim-dap', 'AutoSave.nvim', 'lspkind-nvim', 'editorconfig-vim', 'comfortable-motion.vim', 'telescope.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-vsnip'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]], true)
vim.cmd [[source /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]]
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]], false)
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], true)
vim.cmd [[source /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], false)
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/sebas5758/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
