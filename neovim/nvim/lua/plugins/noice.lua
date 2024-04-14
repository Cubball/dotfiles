-- NOTE: not sure about this one yet
return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                background_colour = "#000000",
                max_width = 70,
                max_height = 10,
                render = "wrapped-compact",
                stages = "fade",
                timeout = 2500,
            },
        },
    },
    config = function()
        local noice = require("noice")
        noice.setup({
            lsp = {
                signature = {
                    enabled = false,
                },
            },
        })
        vim.keymap.set("n", "<leader>nc", "<CMD>NoiceDismiss<CR>", { desc = "[N]oice [C]lose" })
    end,
}
