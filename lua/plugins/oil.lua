return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		default_file_explorer = true,
		columns = {
			{ "permissions", highlight = "Grey" },
			{
				"size",
				align = "right",
				highlight = "Aqua",
			},
			{ "mtime", highlight = "Yellow" },
			"icon",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = true,
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Open file explorer" },
	},
}
