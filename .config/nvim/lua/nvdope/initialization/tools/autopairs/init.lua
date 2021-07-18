local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"](npairs.esc("<cr>"))
        else
            return npairs.esc("<cr>")
        end
    else
        return npairs.autopairs_cr()
    end
end

npairs.setup(
    {
        disable_filetype = {"TelescopePrompt"},
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true, -- add bracket pairs after quote
        enable_check_bracket_line = true, --- check bracket in same line
        check_ts = true,
        ts_config = {
            lua = {"string"},
            -- it will not add pair on that treesitter node
            javascript = {"template_string"},
            java = false
            -- don't check treesitter on java
        }
    }
)

require("nvim-treesitter.configs").setup {
    autopairs = {enable = true}
}

local ts_conds = require("nvim-autopairs.ts-conds")

-- press % => %% is only inside comment or string
npairs.add_rules(
    {
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({"string", "comment"})),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({"function"}))
    }
)
