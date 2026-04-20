return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		attach_to_untracked = true,
		current_line_blame = false,
		current_line_blame_opts = {
			delay = 300,
		},

		-- Keymaps
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- Stage / Reset / Undo
			map("n", "<leader>hs", gitsigns.stage_hunk)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			map("n", "<leader>hu", gitsigns.undo_stage_hunk)

			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)

			-- Quickfix List
			map("n", "<leader>hq", function()
				gitsigns.setqflist("all")
			end)

			-- Preview
			map("n", "<leader>hp", gitsigns.preview_hunk)

			-- Blame line
			map("n", "<leader>bl", function()
				gitsigns.blame_line({ full = true })
			end)
		end,
	},
}
