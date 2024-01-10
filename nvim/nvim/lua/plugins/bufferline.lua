return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                show_buffer_close_icons = false,
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.no_bold,
                },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        })
        vim.keymap.set("n", "H", vim.cmd.BufferLineCyclePrev, { desc = "H - go to the buffer to the left"})
        vim.keymap.set("n", "L", vim.cmd.BufferLineCycleNext, { desc = "L - go to the buffer to the right"})
        vim.keymap.set("n", "<leader>h", vim.cmd.BufferLineMovePrev, { desc = "Space + h - move the current buffer to the left"})
        vim.keymap.set("n", "<leader>l", vim.cmd.BufferLineMoveNext, { desc = "Space + l - move the current buffer to the right" })
        vim.keymap.set("n", "<leader>gb", vim.cmd.BufferLinePick, { desc = "[G]o to [B]uffer"})
    end,
}
