---@diagnostic disable: undefined-global
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		quickfile = { enabled = true },
		gh = { enabled = true },
		indent = {
			enabled = true,
			animate = { enabled = false },
		},
		picker = {
			enabled = true,
			win = {
				input = {
					keys = {
						["<C-[>"] = { "close", mode = { "n", "i" } },
						["<A-n>"] = { "list_down", mode = { "i", "n" } },
						["<A-p>"] = { "list_up", mode = { "i", "n" } },
						["<A-P>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<A-N>"] = { "preview_scroll_down", mode = { "i", "n" } },
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		-- Files
		vim.keymap.set("n", "<leader><space>", function()
			Snacks.picker.files()
		end, { desc = "Find Files" })

		-- Search
		vim.keymap.set("n", "<leader>/", function()
			Snacks.picker.grep()
		end, { desc = "Grep" })
		vim.keymap.set({ "n", "v" }, "<leader>/w", function()
			Snacks.picker.grep_word()
		end, { desc = "Grep Word" })
		vim.keymap.set("n", "<leader>sh", function()
			Snacks.picker.help()
		end, { desc = "Help Pages" })
		vim.keymap.set("n", "<leader>sk", function()
			Snacks.picker.keymaps()
		end, { desc = "Keymaps" })

		-- Git
		vim.keymap.set("n", "<leader>gb", function()
			Snacks.picker.git_branches()
		end, { desc = "Git Branches" })
		vim.keymap.set("n", "<leader>gl", function()
			Snacks.picker.git_log()
		end, { desc = "Git Log" })
		vim.keymap.set("n", "<leader>gs", function()
			Snacks.picker.git_status()
		end, { desc = "Git Status" })
		vim.keymap.set("n", "<leader>gd", function()
			Snacks.picker.git_diff()
		end, { desc = "Git Diff (Hunks)" })

		-- GitHub
		vim.keymap.set("n", "<leader>is", function()
			Snacks.picker.gh_issue({ state = "all" })
		end, { desc = "GitHub Issues (all)" })
		vim.keymap.set("n", "<leader>pr", function()
			Snacks.picker.gh_pr({ state = "all" })
		end, { desc = "GitHub PR (all)" })

		-- Others
		vim.keymap.set("n", "<leader>lg", function()
			Snacks.picker.lazygit()
		end, { desc = "Lazygit" })
	end,
}
