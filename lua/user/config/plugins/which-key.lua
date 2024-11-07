return {
	"folke/which-key.nvim",

	event = "VimEnter",

	init = function()
		require("user.config.keymap").configure()
	end,

	opts = {
		plugins = {
			presets = {
				operators = true,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false
			},
		},
	}
}
