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

		-- LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
			callback = function()
				local buf = event.buf
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
				end

				map("n", "gd", function()
					Snacks.picker.lsp_definitions()
				end, "Goto Definition")
				map("n", "gD", function()
					Snacks.picker.lsp_declarations()
				end, "Goto Declarations")
				map("n", "gr", function()
					Snacks.picker.lsp_references()
				end, "Goto References")
				map("n", "gi", function()
					Snacks.picker.lsp_implementations()
				end, "Goto Implementation")
				map("n", "gt", function()
					Snacks.picker.lsp_type_definitions()
				end, "Goto Type Definition")
				map("n", "gs", function()
					Snacks.picker.lsp_symbols()
				end, "LSP Symbols")
				map("n", "gS", function()
					Snacks.picker.lsp_workspace_symbols()
				end, "LSP Workspace Symbols")
			end,
		})

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
