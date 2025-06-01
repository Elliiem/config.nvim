return {
	"folke/which-key.nvim",

	event = "VimEnter",

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
