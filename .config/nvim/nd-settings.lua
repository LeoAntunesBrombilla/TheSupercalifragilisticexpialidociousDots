
-- general
O.auto_complete = true
-- O.colorscheme = 'lunar'
O.auto_close_tree = 0
O.wrap_lines = false
O.timeoutlen = 100

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true

O.clang.diagnostics.virtual_text = true
O.clang.diagnostics.signs = false
O.clang.diagnostics.underline = false

O.python.formatter = 'yapf'
-- O.python.linter = 'flake8'
O.python.isort = true
O.python.autoformat = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true
O.python.analysis.type_checking = "off"
O.python.analysis.auto_search_paths = true
O.python.analysis.use_library_code_types = true

-- lua
-- TODO look into stylua
O.lua.formatter = 'lua-format'
-- O.lua.formatter = 'lua-format'
O.lua.autoformat = false

-- javascript
O.tsserver.formatter = 'prettier'
O.tsserver.linter = nil
O.tsserver.autoformat = true

