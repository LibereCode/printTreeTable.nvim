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
    just = 'a regular',
    normal = 'mf',
    aNumber = 123,
}
require('printTreeTable').print(tableToPrint)
```

will return:
<!-- markdownlint-disable MD010 -->

```txt output
just
	= a regular
aNumber
	= 123
normal
	= mf
```

### Use in CmdLine

```vim cmdline
:lua LualineTable = require('lualine').get_config()
:PrintTreeTable LualineTable
```

<!-- markdownlint-disable MD010 -->

```txt output
-------------- TreeTable: LualineTable ------------------

sections
	lualine_a
		1
			= mode
	lualine_z
		1
			= function: 0x7fccd06f8b08
		2
			= function: 0x7fccd06f8b38
	lualine_y
		1
			= function: 0x7fccd06f8a78
	lualine_x
		1
			= lsp_status
		2
			= filetype
	lualine_c
		1
			= branch
		2
			= diff
		3
			= diagnostics
	lualine_b
		1
			= filename
extensions
	1
		= neo-tree
	2
		= lazy
	3
		= man
	4
		= mason
	5
		= nvim-dap-ui

 ... ETC ...
```

I recommend to use the lua version honestly, a lot cleaner...

## TODO

- [ ] Somehow print function structure.
- [ ] Make the tree prettier (prolly replace indent with ascii).
