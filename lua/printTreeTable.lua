---@class M

---Use the function `M.print` (if any)
local M = {}

---Used in _user_command_ `TreeTable`
---@param value any
---@param func function
---@param tabs? integer
M.ref = function(value, func, tabs)
    tabs = tabs or 0
    local tabString = string.rep("	", tabs)

    if type(value) == "table" then
        print(tabString .. "{")
        for key, val in pairs(value) do
            print(tabString .. key)
            func(val, func, tabs + 1)
        end
        print(tabString .. "}")
    else
        print(tabString .. "= " .. tostring(value))
    end
end

---Used in _user_command_ `TreeTable`
---@param stringBlock string
---@param keyName string
---@param value any
---@param func function
---@param tabs? integer
---@return string
M.ifTableFunc = function(stringBlock, keyName, value, func, tabs)
    tabs = tabs or 0
    local tabString = string.rep("  ", tabs)

    if type(value) == "table" then
        if keyName ~= "" then
            keyName = tabString .. "┗" .. keyName .. " = "
        end
        stringBlock = stringBlock .. keyName .. "{\n"
        for key, val in pairs(value) do
            stringBlock = func(stringBlock, key, val, func, tabs + 1)
        end
        stringBlock = stringBlock .. tabString .. " }\n"
    else
        stringBlock = stringBlock .. tabString .. "┗" .. keyName .. " = " .. tostring(value) .. "\n"
    end
    return stringBlock
end

---**USE:** `require('printTreeTable').print(<your_tabel>)`
---@param table table Any (semi|kinda|MEGA)-arbitrary lua-table you want to iterate
M.print = function(table)
    if type(table) == "table" then
        local stringBlock = M.ifTableFunc("", "", table, M.ifTableFunc)
        print(stringBlock)
    else
        vim.api.nvim_echo({ { "This is not a table. It should be" } }, true, { err = true })
    end
end

---Create _user_command_ `PrintTreeTable`
M.setup = function()
    vim.api.nvim_create_user_command("PrintTreeTable", function(opts)
        print("Ooooorrr... you can just use the really simple cmd:")
        print("`:lua vim.print(yourTableHere)`")
        local tableName = opts.args -- parse argv
        local tableIn = _G[tableName] -- grab the global
        print([[
-------------- TreeTable: ]] .. tableName .. " ------------------\n")
        M.print(tableIn) -- the JUICE
    end, {
        nargs = 1,
        desc = [[Print Tree-structure of a table-nested table.
USE (nvim-cmdline):
  :lua GlobalTable = require('lualine').get_config()
  :TreeTable GlobalTable]],
    })
end

return M
