return {
    "navarasu/onedark.nvim",
    opts = {
        style = "cool",
        transparent = true,
        term_colors = true,
        code_style = {
            comments = "none",
            keywords = "none",
            functions = "none",
            strings = "none",
            variables = "none",
        },
        highlights = {
            ["@boolean"] = { fg = "$purple" },
            ["@type.builtin"] = { fg = "$purple" },
            ["@type.qualifier.typescript"] = { fg = "$purple" },
            ["@tag.delimiter"] = { fg = "$fg" },
            ["@lsp.type.property"] = { fg = "$fg" },
            ["@lsp.type.variable"] = { fg = "$red" },
            ["@lsp.type.fieldName"] = { fg = "$fg" },
            ["@lsp.type.enumMember"] = { fg = "$fg" },
            ["@lsp.type.constantName"] = { fg = "$fg" },
        },
    },
    config = function(_, opts)
        local onedark = require("onedark")
        onedark.setup(opts)
        onedark.load()
    end,
}
