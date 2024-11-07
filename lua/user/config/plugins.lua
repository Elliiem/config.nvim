local this = {}

function this.setupLazy()
    -- [[ Install `lazy.nvim` plugin manager ]]
    --    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    end ---@diagnostic disable-next-line: undefined-field
    vim.opt.rtp:prepend(lazypath)


    require("lazy").setup({
            require("user.config.plugins.vim-sleuth"),
            require("user.config.plugins.gitsigns"),
            require("user.config.plugins.which-key"),
            require("user.config.plugins.telescope"),
            require("user.config.plugins.nvim-lspconfig"),
            require("user.config.plugins.conform"),
            require("user.config.plugins.nvim-cmp"),
            require("user.config.plugins.tokyonight"),
            require("user.config.plugins.todo-comments"),
            require("user.config.plugins.mini"),
            require("user.config.plugins.nvim-treesitter"),
            require("user.config.plugins.asciidoc-preview"),
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
