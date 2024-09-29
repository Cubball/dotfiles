return {
    {
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
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        main = "rose-pine",
        opts = {
            styles = {
                italic = false,
                transparency = true,
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            styles = {
                comments = { italic = false, },
                keywords = { italic = false, },
            },
            on_highlights = function(hl, c)
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = c.purple,
                    fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                    bg = c.green,
                    fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = c.cyan,
                    fg = c.bg_dark,
                }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd[[colorscheme tokyonight]]
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            styles = {
                comments = {},
                conditionals = {},
            },
            integrations = {
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            -- vim.cmd[[colorscheme catppuccin]]
        end,
    }
}
