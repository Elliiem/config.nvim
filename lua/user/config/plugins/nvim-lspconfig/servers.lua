local lspconfig = require("lspconfig")

--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.

vim.filetype.add({ extension = { zig = 'zig', ["zig.zon"] = 'zig' } })
lspconfig.zls.setup({
    cmd = { "/home/priv/elliiem/dev/zig/tools/zls/zig-out/bin/zls" }
})

lspconfig.lua_ls.setup({
    Lua = {
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
        },
    },
})

lspconfig.bashls.setup({})

vim.filetype.add({ extension = { cpp = 'cpp', hpp = 'cpp' } })
lspconfig.clangd.setup({
    cmd = { "clangd", "--header-insertion=never" }
})

lspconfig.pylsp.setup({})

lspconfig.nushell.setup({})

lspconfig.jdtls.setup({
    cmd = { "jdtls", "--java-executable", "/usr/lib/jvm/java-21-openjdk/bin/java" }
})
