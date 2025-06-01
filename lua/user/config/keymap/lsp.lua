local wk = require("wich-key")

local this = {}

local telescope_builtin = require("telescope.builtin")

function this.configure()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            wk.register({
                ["l"] = {
                    name = "[L]SP",
                    mode = { "n" },
                    ["g"] = {
                        name = "[G]oto",
                        mode = { "n" },
                        ["d"] = {
                            telescope_builtin.lsp_definitions,
                            "[D]efinition",
                            mode = { "n" },
                        },
                        ["D"] = {
                            vim.lsp.buf.declaration,
                            "[D]eclaration",
                            mode = { "n" },
                        },
                        ["r"] = {
                            telescope_builtin.lsp_references,
                            "[R]eferences",
                            mode = { "n" },
                        },
                        ["i"] = {
                            telescope_builtin.lsp_implementations,
                            "[I]mplementations",
                            mode = { "n" },
                        },
                    },
                    ["rn"] = {
                        vim.lsp.buf.rename,
                        "[R]e[N]ame",
                        mode = { "n" },
                    },
                    ["ca"] = {
                        vim.lsp.buf.code_action,
                        "[C]ode [A]ction",
                        mode = { "n" },
                    },
                    ["h"] = {
                        vim.lsp.buf.hover,
                        "[H]over",
                        mode = { "n" },
                    },
                },
            })

            local client = vim.lsp.get_client_by_id(event.data.client_id)

            if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                wk.register({
                    ["l"] = {
                        name = "[L]SP",
                        ["th"] = {
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()),
                            "[T]oggle Inlay [H]ints"
                        }
                    }
                })
            end
        end
    })
end

return this
