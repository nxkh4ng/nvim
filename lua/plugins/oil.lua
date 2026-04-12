return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		columns = {
			"size",
			"icon",
		},
		delete_to_trash = true,
		watch_for_changes = false,
		view_options = {
			show_hidden = true,
			natural_order = "fast",
			case_insensitive = true,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 2000,
			autosave_changes = false,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)

		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil" })
	end,
}
