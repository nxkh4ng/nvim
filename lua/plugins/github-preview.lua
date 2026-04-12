return {
	"wallpants/github-preview.nvim",
	cmd = { "GithubPreviewToggle" },
	ft = { "markdown" },
	opts = {
		single_file = true,
		cursor_line = {
			disable = true,
		},
	},
	config = function(_, opts)
		local gpreview = require("github-preview")
		gpreview.setup(opts)
	end,
}
