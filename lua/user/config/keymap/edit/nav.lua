local wk = require("which-key")

local this = {}

local function stripLine(line)
    return line:gsub("^%s*", ""):gsub("%s*$", "")
end

local function countLeadingWhitespace(line)
    return line:match("^%s*"):len()
end

local function jumpMiddleForward()
    local line = vim.api.nvim_get_current_line()
    local stripped = stripLine(line)
    local leading = countLeadingWhitespace(line)

    local cursor = vim.api.nvim_win_get_cursor(0)
    local column_abs = cursor[2]

    local column_abs_clamped = math.min(math.max(column_abs, leading), math.max(leading + stripped:len() - 1, 0))
    local column_rel = column_abs_clamped - leading

    local offset = math.floor((stripped:len() - column_rel) / 2)

    local dest = column_rel + offset + leading

    vim.api.nvim_win_set_cursor(0, { cursor[1], dest })
end

local function jumpMiddleBackward()
    local line = vim.api.nvim_get_current_line()
    local stripped = stripLine(line)
    local leading = countLeadingWhitespace(line)

    local cursor = vim.api.nvim_win_get_cursor(0)
    local column_abs = cursor[2]

    local column_abs_clamped = math.min(math.max(column_abs, leading), math.max(leading + stripped:len() - 1, 0))
    local column_rel = column_abs_clamped - leading

    local offset = math.ceil(column_rel / 2)
    local dest = column_rel - offset + leading

    vim.api.nvim_win_set_cursor(0, { cursor[1], dest })
end



function this.setup()
    wk.add({
        {
            "<C-j>",
            "<Down><Down><Down><Down><Down>",
            desc = "jump down",
            mode = { "n", "i", "v" },
        },
        {
            "<C-k>",
            "<Up><Up><Up><Up><Up>",
            desc = "jump up",
            mode = { "n", "i", "v" },
        },
        {
            "<C-h>",
            "<Left><Left><Left><Left><Left>",
            desc = "jump left",
            mode = { "n", "i", "v" },
        },
        {
            "<C-l>",
            "<Right><Right><Right><Right><Right>",
            desc = "jump right",
            mode = { "n", "i", "v" },
        },
        {
            "<S-h>",
            function()
                local line = vim.api.nvim_get_current_line()

                vim.fn.cursor(vim.fn.line("."), line:match("^%s*"):len() + 1)
            end,
            desc = "Jump in front of content",
            mode = { "n", "v" },
        },
        {
            "<S-l>",
            function()
                local column = vim.api.nvim_get_current_line():gsub("%s*$", ""):len()

                vim.fn.cursor(vim.fn.line("."), column)
            end,
            desc = "Jump behind content",
            mode = { "n", "v" }
        },
        {
            "<S-k>",
            jumpMiddleForward,
            desc = "Jump to middle of content",
            mode = { "n", "v" },
        },
        {
            "<S-j>",
            jumpMiddleBackward,
            desc = "Jump to middle of content",
            mode = { "n", "v" },
        }
    })
end

return this
