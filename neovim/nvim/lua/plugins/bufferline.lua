return {
    -- TODO: try removing later
    -- "akinsho/bufferline.nvim",
    -- dependencies = {
    --     "nvim-tree/nvim-web-devicons",
    -- },
    -- config = function()
    --     local bufferline = require("bufferline")
    --     bufferline.setup({
    --         options = {
    --             show_buffer_close_icons = false,
    --             style_preset = {
    --                 bufferline.style_preset.no_italic,
    --                 bufferline.style_preset.no_bold,
    --             },
    --             offsets = {
    --                 {
    --                     filetype = "NvimTree",
    --                     text = "File Explorer",
    --                     text_align = "left",
    --                     separator = true,
    --                 },
    --             },
    --         },
    --     })
    --     vim.keymap.set("n", "H", vim.cmd.BufferLineCyclePrev, { desc = "H - go to the buffer to the left"})
    --     vim.keymap.set("n", "L", vim.cmd.BufferLineCycleNext, { desc = "L - go to the buffer to the right"})
    --     vim.keymap.set("n", "<leader>bh", vim.cmd.BufferLineMovePrev, { desc = "[B]uffer + h - move the current buffer to the left"})
    --     vim.keymap.set("n", "<leader>bl", vim.cmd.BufferLineMoveNext, { desc = "[B]uffer + l - move the current buffer to the right" })
    -- end,
}
