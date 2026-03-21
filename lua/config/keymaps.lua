local map = vim.keymap.set

-- TERMINAL MODE
map("n", "<leader>vt", ":vsplit<CR>:term<CR>a", { desc = "Vertical Terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "NORMAL MODE in Terminal" })

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
map("n", "<C-h>", "<cmd>tabp<cr>", { desc = "Next tab" })
map("n", "<C-l>", "<cmd>tabn<cr>", { desc = "Prev tab" })
