return { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
    },
    opts = {
        notify_on_error = false,

        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = {
                c = true,
                cpp = true,
            }

            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,

        formatters = {
            uncrustify = {
                command = "uncrustify",
                args = { "-c", "uncrustify.cfg", "--assume", "$FILENAME" }
            }
        },

        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "uncrustify" }
        },
    },
}
