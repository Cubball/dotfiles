return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "c_sharp" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    main = "nvim-treesitter.configs",
    init = function()
        -- To enable folds
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        -- To disable everything getting folded upon opening a file
        vim.opt.foldenable = false
    end,
}
