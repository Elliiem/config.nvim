local wk = require("which-key")
local conform = require("conform")

local this = {}

function this.configure()
    wk.register({
        ["F"] = {
            conform.format({ async = true, lsp_fallback = false })
        },
    })
end

return this
