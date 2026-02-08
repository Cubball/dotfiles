return {
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
}
