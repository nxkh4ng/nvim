return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "oxlint" },
			typescript = { "oxlint" },
			javascriptreact = { "oxlint" },
			typescriptreact = { "oxlint" },
		}

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
