local wk = require("which-key")

local this = {}

function this.configure()
    require("user.config.keymap.edit").configure()
    require("user.config.keymap.lsp").configure()
    require("user.config.keymap.window").setup()

    require("user.config.keymap.conform").configure()

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
