local map = vim.keymap.set

-- Toggle VIETNAMESE keymap
vim.api.nvim_create_user_command("VnKeymapToggle", function()
    local current = vim.o.keymap
    if current == "vietnamese-telex_utf-8" then
        vim.opt.keymap = ""
        vim.opt.iminsert = 0
        print("Vietnamese keymap OFF")
    else
        vim.opt.keymap = "vietnamese-telex_utf-8"
        vim.opt.iminsert = 1
        print("Vietnamese keymap ON")
    end
end, {})

-- TERMINAL MODE
local width = math.floor(vim.o.columns * 0.34)
map("n", "<leader>tm", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
	vim.cmd("vertical resize " .. width)
	vim.cmd("terminal")
	vim.cmd("startinsert")
end, { desc = "Vertical Terminal Panel", noremap = true, silent = true })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "NORMAL MODE in Terminal" })

-- Move lines in visual selection
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down a line in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up a line in visual selection" })

map("n", "J", "mzJ`z")
map("v", "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')
map("n", "Q", "<nop>")

-- Center cursor when:
-- moving half screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- find search term
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear highlight search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Increase/Decrease indent in VISUAL MODE
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "H", "<cmd>tabp<cr>", { desc = "Next tab" })
map("n", "L", "<cmd>tabn<cr>", { desc = "Prev tab" })
