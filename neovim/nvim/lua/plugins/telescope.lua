return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local themes = require("telescope.themes")
        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    themes.get_dropdown(),
                },
            },
        })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Space + Space - find buffers for quick access" })
        vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]elescope" })
        vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]ecent" })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord (under cursor)" })
        vim.keymap.set("n", "<leader>fc", builtin.live_grep, { desc = "[F]ind [C]ontents" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind in [G]it" })
        vim.keymap.set("n", "<leader>fb", function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown())
        end, { desc = "[F]ind in [B]uffer" })
        vim.keymap.set("n", "<leader>da", builtin.diagnostics, { desc = "[D]iagnostics [A]ll" })
        vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "[G]o to [I]mplementations" })
        vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "[G]o to [R]eferences" })
        vim.keymap.set("n", "<leader>fsd", builtin.lsp_document_symbols, { desc = "[F]ind [S]ymbols in [D]ocument" })
        vim.keymap.set("n", "<leader>fsw", builtin.lsp_dynamic_workspace_symbols, { desc = "[F]ind [S]ymbols in [W]orkspace" })
        telescope.load_extension("ui-select")
    end,
}
