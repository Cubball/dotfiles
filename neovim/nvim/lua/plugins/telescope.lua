return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader><leader>", function() require("telescope.builtin").buffers() end, desc = "Space + Space - find buffers for quick access" },
        { "<leader>ft", function() require("telescope.builtin").builtin() end, desc = "[F]ind [T]elescope" },
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "[F]ind [F]iles" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "[F]ind [B]uffers" },
        { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "[F]ind [W]ord (under cursor)" },
        { "<leader>fc", function() require("telescope.builtin").live_grep() end, desc = "[F]ind [C]ontents" },
        { "<leader>fg", function() require("telescope.builtin").git_files() end, desc = "[F]ind in [G]it" },
        { "<leader>fb", function()
            local builtin = require("telescope.builtin")
            local themes = require("telescope.themes")
            builtin.current_buffer_fuzzy_find(themes.get_dropdown())
        end, desc = "[F]ind in [B]uffer" },
        { "<leader>da", function() require("telescope.builtin").diagnostics() end, desc = "[D]iagnostics [A]ll" },
        { "<leader>gi", function() require("telescope.builtin").lsp_implementations() end, desc = "[G]o to [I]mplementations" },
        { "<leader>gr", function() require("telescope.builtin").lsp_references() end, desc = "[G]o to [R]eferences" },
        { "<leader>fsd", function() require("telescope.builtin").lsp_document_symbols() end, desc = "[F]ind [S]ymbols in [D]ocument" },
        { "<leader>fsw", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "[F]ind [S]ymbols in [W]orkspace" },
    },
    cmd = "Telescope",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["q"] = require("telescope.actions").close,
                    },
                },
            },
        })
    end,
}
