vim.cmd('language en_US.utf8')

local o = vim.opt
-- UI
o.fileencodings = "utf-8,cp1251"
o.fillchars = { eob = " " }
o.guicursor = ""
o.hlsearch = false
o.incsearch = true
o.nu = true
o.relativenumber = true
o.scrolloff = 8
o.termguicolors = true
o.wrap = false

-- Input
o.clipboard = "unnamed"
o.keymap = "ukrainian-jcuken-improved"
o.iminsert = 0
o.imsearch = -1
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.smartindent = true
o.ignorecase = true
o.smartcase = true
o.timeoutlen = 500
o.shellslash = true
o.fileformats = "unix,dos"
o.eol = true
o.fixendofline = true

-- Other
o.splitbelow = true
o.splitright = true
o.swapfile = false

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
