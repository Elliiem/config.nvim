local wk = require("which-key")

local this = {}

function this.configure()
    -- require("user.config.keymap.lsp").configure()
    -- require("user.config.keymap.conform").configure()

    wk.add({
        {
            "<leader>",
            desc = "more",

            {
                "<leader>wk",
                function()
                    vim.cmd("WhichKey")
                end,
                mode = { "n" },
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
        {
            "<C-Down>",
            "<Down><Down><Down><Down><Down>",
            desc = "jump down",
            mode = { "n", "i", "v" },
        },
        {
            "<C-Up>",
            "<Up><Up><Up><Up><Up>",
            desc = "jump up",
            mode = { "n", "i", "v" },
        },
        {
            "<C-Left>",
            "<Left><Left><Left><Left><Left>",
            desc = "jump left",
            mode = { "n", "i", "v" },
        },
        {
            "<C-Right>",
            "<Right><Right><Right><Right><Right>",
            desc = "jump right",
            mode = { "n", "i", "v" },
        },
        {
            "<C-S-Left>",
            function()
                local line = vim.api.nvim_get_current_line()

                vim.fn.cursor(vim.fn.line("."), line:match("^%s*"):len() + 1)
            end,
            desc = "Jump in front of content",
            mode = { "n", "v", "i" },
        },
        {
            "<C-S-Right>",
            function()
                local column = vim.api.nvim_get_current_line():gsub("%s*$", ""):len()

                vim.fn.cursor(vim.fn.line("."), column)
            end,
            desc = "Jump behind content",
            mode = { "n", "v" }
        },
        {
            "<C-S-Right>",
            function()
                local column = vim.api.nvim_get_current_line():gsub("%s*$", ""):len() + 1

                vim.fn.cursor(vim.fn.line("."), column)
            end,
            desc = "Jump behind content",
            mode = { "i" }
        },
        {
            "<C-S-Up>",
            function()
                local line = vim.api.nvim_get_current_line()

                local stripped = line:gsub("^%s*", ""):gsub("%s*$", "")

                local leading_whitespace = line:match("^%s*"):len()

                local column = ((math.floor(stripped:len() / 2)) + leading_whitespace)

                vim.fn.cursor(vim.fn.line("."), column)
            end,
            desc = "Jump to middle of content",
            mode = { "n", "v", "i" },
        },
        {
            "h",
            "<C-S-w><Left>",
            mode = { "n" },
        },
        {
            "<C-h>",
            "<C-S-w>H",
        },
        {
            "<C-S-h>",
            function()
                vim.cmd("lefta vs")
            end,
            mode = { "n" },
        },
        {
            "j",
            "<C-S-w><Down>",
            mode = { "n" },
        },
        {
            "<C-j>",
            "<C-S-w>J",
        },
        {
            "<C-S-j>",
            function()
                vim.cmd("rightb sp")
            end,
            mode = { "n" }
        },
        {
            "k",
            "<C-S-w><Up>",
            mode = { "n" },
        },
        {
            "<C-k>",
            "<C-S-w>K",
        },
        {
            "<C-S-k>",
            function()
                vim.cmd("lefta sp")
            end,
            mode = { "n" },
        },
        {
            "l",
            "<C-S-w><Right>",
            mode = { "n" },
        },
        {
            "<C-l>",
            "<C-S-w>L",
            mode = { "n" },
        },
        {
            "<C-S-l>",
            function()
                vim.cmd("rightb vs")
            end,
            mode = { "n" },
        },
        {
            "<C-p>",
            "\"0p",
            mode = { "n" },
        },
        {
            "<C-S-p>",
            "\"0P",
            mode = { "n" },
        },
    })
end

return this
