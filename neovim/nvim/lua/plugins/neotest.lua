return {
    "nvim-neotest/neotest",
    dependencies = {
        "Issafalcon/neotest-dotnet",
    },
    keys = {
        { "<leader>te", function() require("neotest").summary.toggle() end, desc = "[T]est [E]xplorer" },
    },
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
    end,
}
