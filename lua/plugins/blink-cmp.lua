return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = {
			preset = "none",
			["<A-m>"] = { "show", "show_documentation", "hide_documentation" },
			["<A-y>"] = { "accept" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<A-n>"] = { "select_next", "fallback_to_mappings" },
			["<A-p>"] = { "select_prev", "fallback_to_mappings" },

			["<A-N>"] = { "scroll_documentation_down", "fallback" },
			["<A-P>"] = { "scroll_documentation_up", "fallback" },

			["<A-s>"] = { "show_signature", "hide_signature", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		completion = {
			menu = {
				border = "solid",
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								end

								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
			documentation = {
				window = { border = "solid" },
				auto_show = false,
				treesitter_highlighting = false,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "lua" },
	},
	opts_extend = { "sources.default" },
}
