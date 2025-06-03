local this = {}

function this.configure()
    require("user.config.keymap.edit.nav").configure()
    require("user.config.keymap.edit.paste").configure()
end

return this
