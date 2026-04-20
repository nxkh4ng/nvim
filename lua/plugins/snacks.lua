---@diagnostic disable: undefined-global
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		quickfile = { enabled = true },
		explorer = { enabled = true },
		input = { enabled = true },
		indent = {
			enabled = true,
			animate = { enabled = false },
		},
		picker = {
			enabled = true,
			exclude = {
				".git",
				"node_modules",
				"dist",
				"build",
			},
			win = {
				input = {
					keys = {
						["<C-[>"] = { "close", mode = { "n", "i" } },
						["<A-n>"] = { "list_down", mode = { "i", "n" } },
						["<A-p>"] = { "list_up", mode = { "i", "n" } },
						["<A-P>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<A-N>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<A-o>"] = { "git_stage", mode = { "n", "i" } },
						["<A-r>"] = { "git_restore", mode = { "n", "i" }, nowait = true },
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
		vim.keymap.set("n", "<leader>e", function()
			Snacks.picker.explorer()
		end, { desc = "File Explorer" })

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
		vim.keymap.set("n", "<leader>sH", function()
			Snacks.picker.highlights()
		end, { desc = "Highlight Groups" })
		vim.keymap.set("n", "<leader>sk", function()
			Snacks.picker.keymaps()
		end, { desc = "Keymaps" })

		-- Git
		vim.keymap.set("n", "<leader>gb", function()
			Snacks.picker.git_branches()
		end, { desc = "Git Branches" })
		vim.keymap.set("n", "<leader>gs", function()
			Snacks.picker.git_status()
		end, { desc = "Git Status" })
		vim.keymap.set("n", "<leader>gd", function()
			Snacks.picker.git_diff()
		end, { desc = "Git Diff (Hunks)" })
	end,
}
