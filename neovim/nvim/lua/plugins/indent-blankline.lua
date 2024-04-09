return {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
        local ibl = require("ibl")
        local indent_blankline_enabled = false
        vim.api.nvim_create_user_command("IndentBlankLineToggle", function()
            indent_blankline_enabled = not indent_blankline_enabled
            ibl.setup({ enabled = indent_blankline_enabled })
        end,
        { })
    end
}
