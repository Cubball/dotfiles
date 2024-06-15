return {
    "tpope/vim-dadbod",
    cmd = { "DBUI", "DBUIToggle" },
    keys = {
        { "<leader>odb", "<CMD>DBUIToggle<CR>", desc = "[O]ther: [DB] Toggle" },
    },
    dependencies = {
        "kristijanhusak/vim-dadbod-ui",
        "kristijanhusak/vim-dadbod-completion",
    },
}
