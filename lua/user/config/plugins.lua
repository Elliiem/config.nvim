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
            -- require("user.config.plugins.vim-sleuth"),
            require("user.config.plugins.gitsigns"),         --  TODO:
            require("user.config.plugins.which-key"),        --  TODO:
            require("user.config.plugins.telescope"),        --  TODO:
            require("user.config.plugins.nvim-lspconfig"),   --  TODO:
            require("user.config.plugins.conform"),          --  TODO:
            require("user.config.plugins.nvim-cmp"),         --  TODO:
            require("user.config.plugins.todo-comments"),    --  TODO:
            require("user.config.plugins.mini"),             --  TODO:
            require("user.config.plugins.nvim-treesitter"),  --  TODO:
            require("user.config.plugins.asciidoc-preview"), --  TODO:
            require("user.config.plugins.snacks"),           --  TODO:
            require("user.config.plugins.checkmate"),        --  TODO:
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
