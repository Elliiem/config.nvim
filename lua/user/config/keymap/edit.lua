local this = {}

function this.setup()
    require("user.config.keymap.edit.nav").setup()
    require("user.config.keymap.edit.paste").setup()
end

return this
