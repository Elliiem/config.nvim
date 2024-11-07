local wk = require("which-key")

local this = {}

function this.config()
	wk.register({
		["t"] = { name = "[t]ab" },
		["to"] = {
			name = "[o]pen",
			e = { ":tabnew<CR>", "[e]mpty" },
		},
		["tc"] = {
			name = "[c]lose",
			c = { ":tabclose<CR>", "[c]urrent" },
			o = { ":tabonly<CR>", "[o}ther" },
		},
		["tm"] = {
			name = "[m]ove",
			l = { ":-tabmove<CR>", "[l]eft" },
			r = { ":+tabmove<CR>", "[r]ight" },
		},
	})
end

return this
