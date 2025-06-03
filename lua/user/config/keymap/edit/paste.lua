local wk = require("which-key")

local this = {}

function this.setup()
    wk.add({
        {
            "<C-p>",
            "\"0p",
            desc = "Paste copied after",
            mode = { "n" },
        },
        {
            "<C-S-p>",
            "\"0P",
            desc = "Paste copied before",
            mode = { "n" },
        },
    })
end

return this
