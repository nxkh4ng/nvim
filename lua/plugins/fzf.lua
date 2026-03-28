return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "FzfLua",
	keys = {
		-- Files
		{ "<leader><space>", "<CMD>FzfLua files<CR>", desc = "Find Files" },
		{ "<leader>fb", "<CMD>FzfLua buffers<CR>", desc = "Find Buffers" },
		-- Grep
		{ "<leader>/", "<CMD>FzfLua live_grep<CR>", desc = "Searh Grep" },
		{ "<leader>sv", "<CMD>FzfLua grep_visual<CR>", desc = "Search Visual", mode = "v" },
		-- Git
		{ "<leader>gb", "<CMD>FzfLua git_branches<CR>", desc = "Git Branches" },
		{ "<leader>gs", "<CMD>FzfLua git_status<CR>", desc = "Git Status" },
		{ "<leader>gc", "<CMD>FzfLua git_commits<CR>", desc = "Git Commits (project)" },
		-- Misc
		{ "<leader>sh", "<CMD>FzfLua helptags<CR>", desc = "Help Tags" },
		{ "<leader>sK", "<CMD>FzfLua keymaps<CR>", desc = "Keymaps" },
		{ "<leader>sH", "<CMD>FzfLua highlights<CR>", desc = "Highlight Groups" },
		{ "<leader>sC", "<CMD>FzfLua colorschemes<CR>", desc = "Color Schemes" },
	},
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			fzf_bin = "fzf",
			winopts = {
				border = "single",
				preview = {
					border = "single",
					delay = 20,
				},
			},
			keymap = {
				builtin = {
					["<M-n>"] = "down",
					["<M-p>"] = "up",
					["<M-S-n>"] = "preview-down",
					["<M-S-p>"] = "preview-up",
				},
			},
			git = {
				status = {
					actions = {
						["right"] = false,
						["left"] = false,
						["alt-s"] = { fn = actions.git_stage_unstage, reload = true },
						["alt-x"] = { fn = actions.git_reset, reload = true },
					},
				},
			},
			files = {
				multiprocess = true,
				fd_opts = "--color=never --hidden --type f --type l --exclude .git",
				rg_opts = "--color=never --hidden --files --glob=!.git",
				find_opts = [[-type f -not -path "*/.git/*"]],
				git_icons = false,
				file_icons = true,
			},
			grep = {
				multiprocess = true,
				rg_opts = "--column --line-number --no-heading --color=always" .. " --smart-case --max-columns=4096",
				rg_glob = true,
				glob_flag = "--iglob",
				glob_separator = "%s%-%-",
				git_icons = false,
				file_icons = true,
			},
			oldfiles = {
				stat_file = true,
				include_current_session = false,
				ignore_current_buffer = true,
			},
		})
		require("fzf-lua").register_ui_select({
			winopts = {
				height = 0.50,
				width = 0.60,
			},
		})
	end,
}
