return {
    "folke/which-key.nvim",

    event = "VimEnter",

    opts = {
        plugins = {
            -- shows a list of your marks on ' and `
            marks = true,

            -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            registers = true,

            spelling = {
                -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                enabled = true,

                -- how many suggestions should be shown in the list?
                suggestions = 20,
            },

            presets = {
                -- adds help for operators like d, y, ...
                operators = true,

                -- adds help for motions
                motions = false,

                -- help for text objects triggered after entering an operator
                text_objects = false,

                -- default bindings on <c-w>
                windows = false,

                -- misc bindings to work with windows
                nav = false,

                -- bindings for folds, spelling and others prefixed with z
                z = false,

                -- bindings for prefixed with g
                g = false,
            },
        },

        win = {
            wo = {
                -- value between 0-100 0 for fully opaque and 100 for fully transparent
                winblend = 20,
            },
        },
    }
}
