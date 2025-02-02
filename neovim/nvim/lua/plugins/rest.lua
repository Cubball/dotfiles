return {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    keys = {
        { "<leader>rr", "<CMD>Rest run<CR>", desc = "[R]est [R]un" },
        { "<leader>re", "<CMD>Rest env select<CR>", desc = "[R]est Select [E]nv" },
    },
}
