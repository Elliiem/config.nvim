local wk = require("which-key")

local this = {}

function this.setup()
    wk.add({
        {
            "<leader>w",
            group = "[W]indow",

            {
                "<leader>wg",
                group = "[G]o",

                {
                    "<leader>wgh",
                    "<C-W>h",
                    desc = "Left",
                    mode = { "n" }
                },
                {
                    "<leader>wgj",
                    "<C-W>j",
                    desc = "Down",
                    mode = { "n" }
                },
                {
                    "<leader>wgk",
                    "<C-W>k",
                    desc = "Up",
                    mode = { "n" }
                },
                {
                    "<leader>wgl",
                    "<C-W>l",
                    desc = "Right",
                    mode = { "n" }
                }
            },
            {
                "<leader>ws",
                group = "[S]plit",

                {
                    "<leader>wsv",
                    ":vert sp<CR>",
                    desc = "[V]ertical",
                },
                {
                    "<leader>wsh",
                    ":hor sp<CR>",
                    desc = "[H]orizontal",
                }
            },
        }
    })
end

return this
