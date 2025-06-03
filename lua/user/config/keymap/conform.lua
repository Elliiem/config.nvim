local wk = require("which-key")
local conform = require("conform")

local this = {}

function this.setup()
    wk.add({
        {
            "<leader>F",
            function()
                conform.format({ async = true, lsp_fallback = false })
            end,
            desc = "[F]ormat",
            mode = { "n" },
        },
    })
end

return this
