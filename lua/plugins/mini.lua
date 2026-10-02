return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		local mini_surround = require("mini.surround")
		local mini_splitjoin = require("mini.splitjoin")
		local mini_hipatterns = require("mini.hipatterns")
		local mini_pairs = require("mini.pairs")
		local mini_ai = require("mini.ai")
		local mini_diff = require("mini.diff")

		mini_surround.setup({
			mappings = {
				add = "sa", -- in NORMAL and VISUAL mode
				delete = "sd",
				replace = "sr",
			},
		})

		mini_splitjoin.setup({
			mappings = {
				toggle = "",
				split = "S",
			},
		})

		mini_diff.setup({
			view = {
				style = "sign",
				signs = { add = "┃", change = "┃", delete = "┃" },
				priority = 199,
			},
			mappings = {
				-- Apply hunks inside a visual/operator region
				apply = "gh",

				-- Reset hunks inside a visual/operator region
				reset = "gH",

				-- Hunk range textobject to be used inside operator
				-- Works also in Visual mode if mapping differs from apply and reset
				textobject = "gh",

				-- Go to hunk range in corresponding direction
				goto_first = "[H",
				goto_prev = "[h",
				goto_next = "]h",
				goto_last = "]H",
			},
		})

		mini_hipatterns.setup({
			highlighters = { hex_color = mini_hipatterns.gen_highlighter.hex_color() },
		})

		mini_pairs.setup()
		mini_ai.setup()
	end,
}
