local this = {}

local function installLazy()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end ---@diagnostic disable-next-line: undefined-field

    vim.opt.rtp:prepend(lazypath)
end

function this.setup()
    installLazy()

    require("lazy").setup({
            require("user.config.plugins.gitsigns"),
            require("user.config.plugins.which-key"),
            require("user.config.plugins.telescope"),
            require("user.config.plugins.nvim-lspconfig"),
            require("user.config.plugins.conform"),
            require("user.config.plugins.nvim-cmp"), --  TODO: Rethink keymaps
            require("user.config.plugins.todo-comments"),
            require("user.config.plugins.mini"),     --  TODO: Setup plugins
            require("user.config.plugins.nvim-treesitter"),
            require("user.config.plugins.asciidoc-preview"),
            require("user.config.plugins.snacks"), --  TODO: Setup plugins
            require("user.config.plugins.checkmate"),
            require("user.config.plugins.Enby"),
        },
        {
            ui = {
                -- If you are using a Nerd Font: set icons to an empty table which will use the
                -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
                icons = vim.g.have_nerd_font and {} or {
                    cmd = "⌘",
                    config = "🛠",
                    event = "📅",
                    ft = "📂",
                    init = "⚙",
                    keys = "🗝",
                    plugin = "🔌",
                    runtime = "💻",
                    require = "🌙",
                    source = "📄",
                    start = "🚀",
                    task = "📌",
                    lazy = "💤",
                },
            },
        })
end

return this
