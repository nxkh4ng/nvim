return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			go = { "gofumpt", "goimports" },
			lua = { "stylua" },
			javascript = { "oxfmt" },
			typescript = { "oxfmt" },
			javascriptreact = { "oxfmt" },
			typescriptreact = { "oxfmt" },
			markdown = { "oxfmt" },
			html = { "oxfmt" },
			css = { "oxfmt" },
			yaml = { "oxfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 2000 },
	},
}
