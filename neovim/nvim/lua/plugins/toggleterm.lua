return {
    "akinsho/toggleterm.nvim",
    opts = {
        open_mapping = "<leader>tt",
        shell = "pwsh.exe -NoLogo",
        shade_terminals = false,
        insert_mappings = false,
        winbar = {
            enabled = false, -- TODO: try this later
            name_formatter = function(term)
                if term.display_name then
                    return term.display_name
                end

                return "[term " .. term.id .. "]"
            end,
        },
    },
}
