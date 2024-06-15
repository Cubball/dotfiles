return {
    "github/copilot.vim",
    cmd = "Copilot",
    keys = {
        { "<leader>oce", "<CMD>Copilot enable<CR>", desc = "[O]ther: [C]opilot [E]nable" },
        { "<leader>ocd", "<CMD>Copilot disable<CR>", desc = "[O]ther: [C]opilot [D]isable" },
    },
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
}
