---@class M

---Use the function `M.print` (if any)
local M = {}

---Used in _user_command_ `TreeTable`
---@param value any
---@param func function
---@param tabs? integer
M.ifTableFunc = function(value, func, tabs)
    tabs = tabs or 0
    local tabString = string.rep("	", tabs)

    if type(value) == "table" then
        for key, val in pairs(value) do
            print(tabString .. key)
            func(val, func, tabs + 1)
        end
    else
        print(tabString .. "= " .. tostring(value))
    end
end

---**USE:** `require('printTreeTable').print(<your_tabel>)`
---@param table table Any (semi|kinda|MEGA)-arbitrary lua-table you want to iterate
M.print = function(table)
    if type(table) == "table" then
        M.ifTableFunc(table, M.ifTableFunc)
    end
end

---Create _user_command_ `PrintTreeTable`
M.setup = function()
    vim.api.nvim_create_user_command("PrintTreeTable", function(opts)
        local tableName = opts.args
        local tableIn = _G[tableName]
        print([[
-------------- TreeTable: ]] .. tableName .. " ------------------\n")
        M.print(tableIn)
    end, {
        nargs = 1,
        desc = [[Print Tree-structure of a table-nested table.
USE (nvim-cmdline):
  :lua GlobalTable = require('lualine').get_config()
  :TreeTable GlobalTable]],
    })
end

return M
