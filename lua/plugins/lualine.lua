return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = false,
			theme = "auto",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			global_status = true,
			refresh = {
				statusline = 500,
				tabline = 500,
				winbar = 500,
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
				{ "branch" },
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
					new_file_status = true,
					path = 1,
					shorting_target = 30,
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
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							return ""
						end
						if #clients == 1 then
							return "" .. clients[1].name
						end
						local names = vim.tbl_map(function(c)
							return c.name:match("^%a+")
						end, clients)
						return "" .. table.concat(names, ", ")
					end,
				},
				{
					"filetype",
					icons_enabled = true,
					colored = true,
					icon_only = false,
				},
			},
			lualine_y = {
				{
					"fileformat",
					icons_enabled = true,
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

		extensions = { "quickfix", "mason", "lazy" },
	},
}
