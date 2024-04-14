return {
    "nvim-neotest/neotest",
    dependencies = {
        "Issafalcon/neotest-dotnet",
    },
    -- NOTE: using only a custom command for now, might bring the keymap later
    -- keys = {
    --     { "<leader>te", function() require("neotest").summary.toggle() end, desc = "[T]est [E]xplorer" },
    -- },
    cmd = "TestExplorer",
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-dotnet"),
            },
            quickfix = {
                enabled = false,
                open = false,
            },
        })
        vim.api.nvim_create_user_command("TestExplorer", function() neotest.summary.toggle() end, { })
    end,
}
