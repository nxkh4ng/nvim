return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(ev)
				local buf = ev.buf
				local ft = vim.bo[buf].filetype
                local disable_ft = {
                    markdown = true,
                    yaml = true,
                }

				local lang = vim.treesitter.language.get_lang(ft) or ft
				if not pcall(vim.treesitter.language.inspect, lang) then
					return
				end

				-- Highlight
				vim.treesitter.start(buf)
				-- Indent
                if not disable_ft[ft] then
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
			end,
		})
	end,
}
