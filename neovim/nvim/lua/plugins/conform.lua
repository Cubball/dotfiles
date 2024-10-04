return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                html = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
            },
        })

        vim.keymap.set("n", "<leader>fm", function() conform.format({
            timeout_ms = 3000,
            lsp_fallback = true,
        }) end, { desc = "[F]or[M]at", })
    end
}
