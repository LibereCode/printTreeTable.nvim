# printTreeTable.nvim

> [!NOTE]
> Just use `vim.print()`...

Iterate recursively over a lua-table and print out all pairs and values,
formatted like [cli-cmd `tree`](https://oldmanprogrammer.net/source.php?dir=projects/tree)

## USE

First add it with your favorite plugin-manager.

### lazy.nvim

```lua whereever.lua
-- Together with other files --
return {
    -- ... other plugins
    {
        'LibereCode/printTreeTable.nvim',
        -- opts give you a user_command (:help nvim_create_user_command())
        opts = {},
    },
    -- ... other plugins
}
```

### vim.pack

```lua packman.lua
-- This is the builtin package manager for nvim. see `:h vim.pack`

vim.pack.add({
    -- ... other plugins
    'https://github.com/LibereCode/printTreeTable.nvim', -- TODO: change name
    -- ... other plugins
})

-- gives you a user_command ( see :help nvim_create_user_command() )
require('printTreeTable').setup()
```

### Use with lua

```lua file.lua
local tableToPrint = {
    just = "a regular",
    everyday = {
        normal = "mf",
    },
    aNumber = 123,
}
require("printTreeTable").print(tableToPrint)

--[[ OUTPUT
{
  ┗━everyday = {
    ┗━normal = mf
    }
  ┗━just = a regular
  ┗━aNumber = 123
}
]]
```

### Use in CmdLine

```vim cmdline
:[lua](2026-05-29_lua.md) LualineTable = require('lualine').get_config()
:PrintTreeTable LualineTable

" OUTPUT
"-------------- TreeTable: LualineTable ------------------
"
"{
"  ┗━winbar = {}
"  ┗━options = {
"    ┗━globalstatus = false
"    ┗━always_show_tabline = true
"    ┗━always_divide_middle = true
"    ┗━refresh = {
"      ┗━winbar = 1000
"      ┗━refresh_time = 16
"      ┗━statusline = 1000
"      ┗━events = {
"        ┗━1 = WinEnter
"        ┗━2 = BufEnter
"        ┗━3 = BufWritePost
"        ┗━4 = SessionLoadPost
"        ┗━5 = FileChangedShellPost
"        ┗━6 = VimResized
"        ┗━7 = Filetype
"        ┗━8 = CursorMoved
"        ┗━9 = CursorMovedI
"        ┗━10 = ModeChanged
"        }
"      ┗━tabline = 1000
"
" ... ETC ...
```

I recommend to use the lua version honestly, a lot cleaner...

## TODO

- [ ] Somehow print function structure.
- [ ] Make the tree prettier (prolly replace indent with ascii).
