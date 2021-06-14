local lv_utils = {}


local lsp = vim.lsp
local cmd = vim.cmd

function lv_utils.define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        cmd("augroup " .. group_name)
        cmd("autocmd!")

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            cmd(command)
        end

        cmd("augroup END")
    end
end

-- lsp

function lv_utils.add_to_workspace_folder()
    lsp.buf.add_workspace_folder()
end

function lv_utils.clear_references()
    lsp.buf.clear_references()
end

function lv_utils.code_action()
    lsp.buf.code_action()
end

function lv_utils.declaration()
    lsp.buf.declaration()
    lsp.buf.clear_references()
end

function lv_utils.definition()
    lsp.buf.definition()
    lsp.buf.clear_references()
end

function lv_utils.document_highlight()
    lsp.buf.document_highlight()
end

function lv_utils.document_symbol()
    lsp.buf.document_symbol()
end

function lv_utils.formatting()
    lsp.buf.formatting()
end

function lv_utils.formatting_sync()
    lsp.buf.formatting_sync()
end

function lv_utils.hover()
    lsp.buf.hover()
end

function lv_utils.implementation()
    lsp.buf.implementation()
end

function lv_utils.incoming_calls()
    lsp.buf.incoming_calls()
end

function lv_utils.list_workspace_folders()
    lsp.buf.list_workspace_folders()
end

function lv_utils.outgoing_calls()
    lsp.buf.outgoing_calls()
end

function lv_utils.range_code_action()
    lsp.buf.range_code_action()
end

function lv_utils.range_formatting()
    lsp.buf.range_formatting()
end

function lv_utils.references()
    lsp.buf.references()
    lsp.buf.clear_references()
end

function lv_utils.remove_workspace_folder()
    lsp.buf.remove_workspace_folder()
end

function lv_utils.rename()
    lsp.buf.rename()
end

function lv_utils.signature_help()
    lsp.buf.signature_help()
end

function lv_utils.type_definition()
    lsp.buf.type_definition()
end

function lv_utils.workspace_symbol()
    lsp.buf.workspace_symbol()
end

-- diagnostic

function lv_utils.get_all()
    lsp.diagnostic.get_all()
end

function lv_utils.get_next()
    lsp.diagnostic.get_next()
end

function lv_utils.get_prev()
    lsp.diagnostic.get_prev()
end

function lv_utils.goto_next()
    lsp.diagnostic.goto_next()
end

function lv_utils.goto_prev()
    lsp.diagnostic.goto_prev()
end

function lv_utils.show_line_diagnostics()
    lsp.diagnostic.show_line_diagnostics()
end

-- git signs

function lv_utils.next_hunk()
    require("gitsigns").next_hunk()
end

function lv_utils.prev_hunk()
    require("gitsigns").prev_hunk()
end

function lv_utils.stage_hunk()
    require("gitsigns").stage_hunk()
end

function lv_utils.undo_stage_hunk()
    require("gitsigns").undo_stage_hunk()
end

function lv_utils.reset_hunk()
    require("gitsigns").reset_hunk()
end

function lv_utils.reset_buffer()
    require("gitsigns").reset_buffer()
end

function lv_utils.preview_hunk()
    require("gitsigns").preview_hunk()
end

function lv_utils.blame_line()
    require("gitsigns").blame_line()
end

-- misc
function lv_utils.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

return lv_utils
