local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
opt.wrap = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitright = true
opt.confirm = true
opt.scrolloff = 10
opt.updatetime = 200
opt.timeoutlen = 500

-- Shell
if vim.fn.has("win32") == 1 then
	opt.shell = "pwsh"
	opt.shellcmdflag =
		"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
	opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	opt.shellquote = ""
	opt.shellxquote = ""
end

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.backspace = { "indent", "eol", "start" }

-- File handling
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- ShaDa
opt.shadafile = vim.fn.stdpath("data") .. "/shada/main.shada"
opt.shada = "'100,<50,s10,h,/100"

-- Visual
opt.signcolumn = "yes"
opt.winborder = "single"
opt.background = "dark"
opt.termguicolors = true

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
