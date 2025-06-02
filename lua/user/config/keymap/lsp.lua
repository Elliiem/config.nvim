local wk = require("which-key")

local this = {}

local telescope_builtin = require("telescope.builtin")

function this.configure()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            wk.add({
                {
                    "<leader>l",
                    group = "LSP",

                    {
                        "<leader>lrn",
                        vim.lsp.buf.rename,
                        desc = "[R]e[N]ame",
                        mode = { "n" },
                    },
                    {
                        "<leader>lh",
                        vim.lsp.buf.hover,
                        desc = "[H]over",
                        mode = { "n" },
                    },
                    {
                        "<leader>lca",
                        vim.lsp.buf.code_action,
                        desc = "[C]ode [A]ction",
                        mode = { "n" },
                    },
                    {
                        "<leader>lg",
                        group = "[G]oto",

                        {
                            "<leader>lgd",
                            telescope_builtin.lsp_definitions,
                            desc = "[D]efinition",
                            mode = { "n" },
                        },
                        {
                            "<leader>lgD",
                            vim.lsp.buf.declaration,
                            desc = "[D]eclaration",
                            mode = { "n" },
                        },
                        {
                            "<leader>lgr",
                            telescope_builtin.lsp_references,
                            desc = "[R]eferences",
                            mode = { "n" },
                        },
                        {
                            "<leader>lgi",
                            telescope_builtin.lsp_implementations,
                            desc = "[I]mplementations",
                            mode = { "n" },
                        },
                    },
                },
            })

            local client = vim.lsp.get_client_by_id(event.data.client_id)

            if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                wk.add({
                    {
                        "<leader>lth",
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()),
                        desc = "[T]oggle Inlay [H]ints",
                        mode = { "n" },
                    }
                })
            end
        end
    })

    --  TODO: Remove keymaps after LS detaches
end

return this
