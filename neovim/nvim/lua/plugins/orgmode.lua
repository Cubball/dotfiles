return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
        org_agenda_files = "D:/Notes/**/*",
        org_default_notes_file = "D:/Notes/refile.org",
        mappings = {
            global = {
                org_agenda = "<leader>na",
                org_capture = "<leader>nc",
            },
            org = {
                org_toggle_checkbox = "<leader><leader>",
            },
        },
        org_capture_templates = {
            t = {
                description = "Task",
                template = "* TODO %?",
            },
            g = {
                description = "Grocery Item",
                template = "* - [ ] %?",
            },
            h = {
                description = "Thought",
                template = "* %?",
            },
        },
    },
}
