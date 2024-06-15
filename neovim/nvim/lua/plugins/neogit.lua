return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    tag = "v0.0.1",
    opts = {
        kind = "vsplit",
        highlight = {
            italic = false,
        },
        commit_editor = {
            kind = "floating",
        },
        disable_insert_on_commit = true,
        sections = {
            untracked = {
                folded = true,
            },
            unmerged_upstream = {
                folded = true,
            },
        },
    },
    keys = {
        { "<leader>gs", "<CMD>Neogit<CR>", desc = "[G]it [S]tatus" },
        { "<leader>dvo", "<CMD>DiffviewOpen<CR>", desc = "[D]iff[V]iew [O]pen" },
        { "<leader>dvc", "<CMD>DiffviewClose<CR>", desc = "[D]iff[V]iew [C]lose" },
        { "<leader>dvf", "<CMD>DiffviewToggleFiles<CR>", desc = "[D]iff[V]iew [F]iles" },
        { "<leader>dvh", "<CMD>DiffviewFileHistory<CR>", desc = "[D]iff[V]iew [H]istory" },
    },
}
