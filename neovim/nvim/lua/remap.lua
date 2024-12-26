vim.g.mapleader = " "

-- Move chunck of text with J K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "J in Visual Mode - move selection down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "K in Visual Mode - move selection up", silent = true })

vim.keymap.set("i", "jk", "<Esc>", { desc = "jk in Insert Mode - escape" })
vim.keymap.set("c", "jk", "<C-c>", { desc = "jk in Command Mode - escape" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "jk in Terminal Mode - escape" })

-- Keep cursor in it's place when doing J in normal mode
vim.keymap.set("n", "J", "mzJ`z")

-- Keep the current line in the center of the screen when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Same as for scrolling but for going over search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Deleting, cutting and pasting text
vim.keymap.set({"n", "x"}, "<leader>d", '"_d', { desc = "Space + d - delete without replacing text in register" })
vim.keymap.set({"n", "x"}, "<leader>c", '"_c', { desc = "Space + c - delete without replacing text in register" })
vim.keymap.set({"n", "x"}, "<leader>x", '"_x', { desc = "Space + x - delete without replacing text in register" })
vim.keymap.set({"n", "x"}, "<leader>s", '"_s', { desc = "Space + s - delete without replacing text in register" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Space + p - paste without replacing text in register" })

-- Remaps for navigating / deleting buffers
vim.keymap.set("n", "<leader>bd", vim.cmd.bd, { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>ba", "<CMD>%bd<CR>", { desc = "[B]uffer delete [A]ll" })
vim.keymap.set("n", "<leader>bc", "<CMD>%bd|e#|bd#<CR>", { desc = "[B]uffer delete except [C]urrent" })

-- Splits
vim.keymap.set("n", "<leader>sv", vim.cmd.vsp, { desc = "[S]plit [V]ertical" })
vim.keymap.set("n", "<leader>sh", vim.cmd.sp, { desc = "[S]plit [H]orizontal" })
vim.keymap.set("n", "<leader>ss", "<C-w>R", { desc = "[S]plit [S]wap" })
vim.keymap.set("n", "<leader>sc", "<C-w>c", { desc = "[S]plit [C]lose" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ctrl + j in Normal Mode - go to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ctrl + k in Normal Mode - go to top split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ctrl + h in Normal Mode - go to left split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ctrl + l in Normal Mode - go to right split" })
vim.keymap.set("t", "<C-j>", "<CMD>wincmd j<CR>", { desc = "Ctrl + j in Terminal Mode - go to bottom split" })
vim.keymap.set("t", "<C-k>", "<CMD>wincmd k<CR>", { desc = "Ctrl + k in Terminal Mode - go to top split" })
vim.keymap.set("t", "<C-h>", "<CMD>wincmd h<CR>", { desc = "Ctrl + h in Terminal Mode - go to left split" })
vim.keymap.set("t", "<C-l>", "<CMD>wincmd l<CR>", { desc = "Ctrl + l in Terminal Mode - go to right split" })
-- Resizing splits
vim.keymap.set("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Ctrl + LeftArrow - make current split narrower" })
vim.keymap.set("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Ctrl + RightArrow - make current split wider" })
vim.keymap.set("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Ctrl + UpArrow - make current split taller" })
vim.keymap.set("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Ctrl + DownArrow - make current split shorter" })

-- Switch keymaps
vim.keymap.set("i", "<C-l>", "<C-^>")

-- Sourcing and executing stuff
vim.keymap.set("n", "<leader><leader>x", "<CMD>source %<CR>", { desc = "E[X]ecute the whole file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "E[X]ecute the current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "E[X]ecute the selection" })
