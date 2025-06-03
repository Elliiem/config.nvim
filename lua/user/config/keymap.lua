local wk = require("which-key")

local this = {}

function this.setup()
    require("user.config.keymap.edit").setup()
    require("user.config.keymap.lsp").setup()
    require("user.config.keymap.window").setup()

    require("user.config.keymap.conform").setup()

    wk.add({
        {
            "<leader>",
            desc = "more",
        },
        {
            "<leader>t",
            desc = "tab",

            {
                "<leader>tn",
                function()
                    vim.cmd("tabnew")
                end,
                mode = { "n" },
            },
        },
        {
            ",",
            function()
                vim.cmd("tabprevious")
            end,
            mode = { "n" },
        },
        {
            ".",
            function()
                vim.cmd("tabnext")
            end,
            mode = { "n" },
        },
    })
end

return this
