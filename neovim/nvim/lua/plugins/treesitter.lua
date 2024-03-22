return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "c_sharp" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<TAB>",
                node_decremental = "<S-TAB>",
            },
        },
        textobjects = {
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                    ["<leader>m"] = "@function.outer",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                    ["<leader>M"] = "@function.outer",
                },
            },
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
