local o = vim.opt
o.clipboard = "unnamed"
o.expandtab = true
o.fileencodings = "utf-8,cp1251"
o.fillchars = { eob = " " }
o.guicursor = ""
o.hlsearch = false
o.ignorecase = true
o.iminsert = 0
o.imsearch = -1
o.incsearch = true
o.keymap = "ukrainian-jcuken-improved"
o.nu = true
o.relativenumber = true
o.scrolloff = 8
o.shiftwidth = 4
o.smartcase = true
o.smartindent = true
o.softtabstop = 4
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 500
o.wrap = false

local yank_highlight_group = vim.api.nvim_create_augroup("yank_highlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 100 })
    end,
    group = yank_highlight_group,
})

local remove_whitespace_group = vim.api.nvim_create_augroup("remove_whitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
    group = remove_whitespace_group,
})
