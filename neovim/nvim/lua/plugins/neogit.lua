return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
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
    },
}
