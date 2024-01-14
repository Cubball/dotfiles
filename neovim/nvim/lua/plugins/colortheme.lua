return {
    "navarasu/onedark.nvim",
    opts = {
        style = "cool", -- "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
        transparent = true, -- set the terminal"s background color to be the same as in "cool" style, so made it transparent
        term_colors = true, 
        code_style = {
            comments = "none",
            keywords = "none",
            functions = "none",
            strings = "none",
            variables = "none",
        },
        highlights = {
            ["@constant.builtin"] = { fg = "$purple" },
            ["@type.builtin"] = { fg = "$purple" },
            ["@boolean"] = { fg = "$purple" },
            ["@tag.delimiter"] = { fg = "$fg" },
            ["@lsp.type.property"] = { fg = "$fg" },
            ["@field"] = { fg = "$fg" },
            ["@tag"] = { fg = "$red" },
            ["@lsp.type.variable"] = { fg = "$red" },
        }, 
    },
    config = function(_, opts)
        local onedark = require("onedark")
        onedark.setup(opts)
        onedark.load()
    end,
}
