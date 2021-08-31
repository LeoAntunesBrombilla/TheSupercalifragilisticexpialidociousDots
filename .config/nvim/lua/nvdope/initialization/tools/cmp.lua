local present, cmp = pcall(require, "cmp")
if not present then
    return
end

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

local function get_kind(kind_item)
	local prsnt, lspkind = pcall(require, "lspkind")
	if not prsnt then
		return kind_icons
	else
		return lspkind.presets.default[kind_item]
	end

end

vim.opt.completeopt = "menuone,noselect"

-- require("luasnip/loaders/from_vscode")._luasnip_vscode_lazy_load()
-- require("luasnip/loaders/from_vscode").lazy_load()
-- require("luasnip/loaders/from_vscode").load()

cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s %s", get_kind(vim_item.kind), vim_item.kind)
                vim_item.menu =
                    ({
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    buffer = "[Buf]",
                    luasnip = "[Snp]",
                    latex_symbols = "[Ltx]"
                })[entry.source.name]

                return vim_item
            end
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }
            ),
            ["<Tab>"] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                    )
                else
                    fallback()
                end
            end,
            ["<S-Tab>"] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end
        },
        sources = {
            -- this also affects the order in the completion menu
            {name = "luasnip"},
            {name = "nvim_lsp"},
            {name = "buffer"},
            {name = "nvim_lua"}
        }
    }
)

