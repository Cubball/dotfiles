return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns
            vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "[H]unk [S]tage" })
            vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[H]unk [U]ndo stage" })
            vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "[H]unk [R]eset" })
            vim.keymap.set("n", "<leader>hj", gs.next_hunk, { desc = "[H]unk [j] - next" })
            vim.keymap.set("n", "<leader>hk", gs.prev_hunk, { desc = "[H]unk [k] - previous" })
            vim.keymap.set("n", "<leader>hv", gs.preview_hunk, { desc = "[H]unk [V]iew" })
            vim.api.nvim_buf_create_user_command(buffer, "GitBlameToggle", function() gs.toggle_current_line_blame() end, { })
        end,
    },
}
