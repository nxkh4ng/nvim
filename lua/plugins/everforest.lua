return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	opts = {
		background = "hard",
		ui_contrast = "high",
		float_style = "bright",
		transparent_background_level = 0,
		italics = false,
		disable_italic_comments = true,
		dim_inactive_windows = true,
	},
	config = function(_, opts)
		require("everforest").setup(opts)
		vim.g.background = "dark"
		vim.cmd([[colorscheme everforest]])
	end,
}
