return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "FzfLua",
	keys = {
		-- Files
		{ "<leader><space>", "<CMD>FzfLua files<CR>", desc = "Find Files" },
		{ "<leader>fb", "<CMD>FzfLua buffers<CR>", desc = "Find Buffers" },
		-- Search
		{ "<leader>sg", "<CMD>FzfLua live_grep<CR>", desc = "Searh Grep" },
		{ "<leader>sv", "<CMD>FzfLua grep_visual<CR>", desc = "Search Visual", mode = "v" },
	},
	opts = {
		fzf_bin = "fzf",
		winopts = {
			preview = {
				delay = 20,
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
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		require("fzf-lua").register_ui_select({
			winopts = {
				height = 0.50,
				width = 0.60,
			},
		})
	end,
}
