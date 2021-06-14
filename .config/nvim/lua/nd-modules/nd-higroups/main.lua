local hi_mapper = require("nd-modules.nd-higroups.hi_mapper")

-- group, guifg, guibg, ctermfg, ctermbg, attr, guisp
-- hi_mapper.highlight(nil, nil, nil, nil, nil, nil, nil, gui)
-- List of valid attributes:
-- bold; underline; undercurl; inverse; italic; standout; nocombine; strikethrough

-- if uncommented, it'll change the background's color

-- light colorscheme
-- hi_mapper.highlight("NORMAL", nil, "#1e222a", nil, nil, nil)

-- dark colorscheme
-- hi_mapper.highlight("NORMAL", nil, "#0b131b", nil, nil, nil)

-- lighter version of the darker color
hi_mapper.highlight("NORMAL", nil, "#111921", nil, nil, nil)

-- Standard syntax highlighting
hi_mapper.highlight("Comment", "#42464e", nil, nil, nil, "italic", nil)
hi_mapper.highlight("Conditional", nil, nil, nil, nil, "italic", nil)
hi_mapper.highlight("Character", nil, nil, nil, nil, "undercurl", nil)
hi_mapper.highlight("SpecialChar", nil, nil, nil, nil, "underline", nil)
hi_mapper.highlight("Repeat", nil, nil, nil, nil, "italic", nil)
hi_mapper.highlight("Function", nil, nil, nil, nil, "italic", nil)
hi_mapper.highlight("Float", nil, nil, nil, nil, "bold", nil)

-- Other
hi_mapper.highlight("DiffAdd", "#81A1C1", "NONE", nil, nil, nil, nil)
hi_mapper.highlight("DiffChange", "#3A3E44", "NONE", nil, nil, nil, nil)
hi_mapper.highlight("DiffModified", "#81A1C1", "NONE", nil, nil, nil, nil)
hi_mapper.highlight("PmenuSel", nil, "#98c379", nil, nil, nil, nil)
hi_mapper.highlight("Pmenu", nil, "#282c34", nil, nil, nil, nil)
hi_mapper.highlight("LineNr", "#42464e", "NONE", nil, nil, nil, nil)
hi_mapper.highlight("StatusLineNC", "#3e4451", "NONE", nil, nil, "underline", nil)
hi_mapper.highlight("SignColumn", nil, "NONE", nil, nil, nil, nil)
hi_mapper.highlight("VertSplit", "#2a2e36", "NONE", nil, nil, nil, nil)
hi_mapper.highlight("EndOfBuffer", "#1e222a", nil, nil, nil, nil, nil)
