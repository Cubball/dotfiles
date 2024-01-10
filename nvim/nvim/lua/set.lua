vim.cmd("language en_US")

-- Fat cursor
vim.opt.guicursor = ""

-- Yank into system clipboard
vim.opt.clipboard = "unnamed"

-- Tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8

vim.opt.fileencodings = "utf-8,cp1251"
vim.opt.keymap = "ukrainian-jcuken-improved"
vim.opt.iminsert = 0
vim.opt.imsearch = -1

vim.opt.termguicolors = true

vim.opt.swapfile = false

-- Remove tildes at the end of the file
vim.opt.fillchars = { eob = " " }
