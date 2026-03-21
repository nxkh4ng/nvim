return {
	"saghen/blink.indent",
	event = "VeryLazy",
	opts = {
		blocked = {
			buftypes = { include_defaults = true },
			filetypes = { include_defaults = true },
		},
		mappings = {
			-- 'top', 'bottom', 'both', or 'none'
			border = "both",
			-- textobjects (e.g. `y2ii` to yank current and outer scope)
			object_scope = "ii",
			object_scope_with_border = "ai",
			-- motions
			goto_top = "[i",
			goto_bottom = "]i",
		},
		static = {
			enabled = true,
			char = "│",
			priority = 1,
			highlights = { "BlinkIndent" },
		},
		scope = {
			enabled = true,
			char = "│",
			priority = 1000,
			highlights = { "BlinkIndentScope" },
		},
	},
}
