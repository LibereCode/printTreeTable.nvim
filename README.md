# printTreeTable.nvim

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
