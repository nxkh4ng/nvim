return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = {
			"*",
			"!lazy",
			"!mason",
		},
		buftypes = {},
		user_commands = true,
		lazy_load = true,
		options = {
			parsers = {
				css = true,
				css_fn = true,
				names = {
					enable = false,
					lowercase = false,
					camelcase = false,
					uppercase = false,
					strip_digits = false,
					custom = false,
				},
				hex = {
					default = true,
					rgb = true,
					rgba = true,
					rrggbb = true,
					rrggbbaa = true,
				},
				rgb = { enable = true },
				hsl = { enable = true },
				oklch = { enable = true },
				tailwind = {
					enable = true,
					update_names = true,
					lsp = {
						enable = true,
						disable_documemt_color = true,
					},
				},
				css_var = {
					enable = true,
					parsers = { css = true },
				},
			},
			display = {
				mode = "background",
				virtualtext = {
					char = "■",
					position = "eol",
					hl_mode = "foreground",
				},
				priority = {
					default = 150,
					lsp = 200,
				},
			},
			debounce_ms = 150,
			always_update = false,
		},
	},
}
