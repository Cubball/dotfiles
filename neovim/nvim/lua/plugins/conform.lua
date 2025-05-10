return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        local format_options = {
            timeout_ms = 3000,
            lsp_fallback = true,
        }
        conform.setup({
            formatters_by_ft = {
                html = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "jq" },
                jsonc = { "jq" },
            },
            format_on_save = format_options,
        })

        vim.keymap.set("n", "<leader>fm", function() conform.format(format_options) end, { desc = "[F]or[M]at", })
    end
}
