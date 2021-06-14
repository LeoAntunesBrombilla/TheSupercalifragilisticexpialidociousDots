local M = {}

--------------------------=== Base16 ===--------------------------
function M.load_onedark_theme()
    local base16 = require "base16"
    base16(base16.themes["onedark"], true)

    --------------------------=== Highlights ===--------------------------
    require("nd-modules.nd-higroups.init")

    -- this controls the background color
    -- cmd("hi Normal guibg=NONE ctermbg=NONE") -- make background transparent
    --------------------------=== Highlights ===--------------------------
end

M.load_onedark_theme()

return M
