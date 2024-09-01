return {
    "mbbill/undotree",
    init = function()
        vim.opt.swapfile = false
        vim.opt.backup = false
        vim.opt.undodir = "D:/Apps/.vim/undodir"
        vim.opt.undofile = true
        vim.g.undotree_DiffCommand = "FC"
    end,
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, desc = "[U]ndoTree" },
    },
}
