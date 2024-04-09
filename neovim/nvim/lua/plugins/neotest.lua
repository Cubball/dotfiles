return {
    "nvim-neotest/neotest",
    dependencies = {
        "Issafalcon/neotest-dotnet"
    },
    keys = {
        -- NOTE: might delete this since it might be easier to view the test output from the test explorer, because I launch them from there
        -- { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "[T]est [O]utput" },
        { "<leader>te", function() require("neotest").summary.toggle() end, desc = "[T]est [E]xplorer" },
        { "<leader>ts", function() require("neotest").output_panel.toggle() end, desc = "[T]est [S]ummary" },
    },
    opts = {
        adapters = {
            require("neotest-dotnet"),
        },
        quickfix = {
            enabled = false,
            open = false,
        },
    }
}
