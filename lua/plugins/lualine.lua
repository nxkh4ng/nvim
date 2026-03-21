return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			icon_enabled = true,
			theme = "auto",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			global_status = true,
			ignore_focus = { "oil" },
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},

		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				},
			},
			lualine_b = {
				{ "branch", icon = "󰊢" },
				{
					"diff",
					colored = true,
					symbols = { added = "+", modified = "~", removed = "-" },
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
						unnamed = "[No Name]",
						newfile = "[New]",
					},
				},
				{
					"diagnostics",
					colored = true,
					update_in_insert = false,
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
			},
			lualine_x = {
				{
					"lsp_status",
					icon = "",
					symbols = {
						spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
						done = "✓",
						separator = ", ",
					},
				},
				{
					"filetype",
					colored = true,
					icon_only = false,
				},
			},
			lualine_y = {
				{
					"fileformat",
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
			},
			lualine_z = { "location" },
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},

		extensions = { "oil", "quickfix", "mason", "lazy" },
	},
}
