return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
        org_agenda_files = "D:/Notes/**/*",
        org_default_notes_file = "D:/Notes/refile.org",
        org_hide_emphasis_markers = true,
        org_log_done = false,
        org_log_repeat = false,
        org_log_into_drawer = false,
        org_blank_before_new_entry = {
            heading = false,
            plain_list_item = false,
        },
        mappings = {
            global = {
                org_agenda = "<leader>na",
                org_capture = "<leader>nc",
            },
            org = {
                org_toggle_checkbox = "<leader><leader>",
                org_previous_visible_heading = "}",
                org_next_visible_heading = "{",
            },
        },
        org_capture_templates = {
            t = {
                description = "Task",
                template = "* TODO %?",
            },
            o = {
                description = "Other",
                template = "* %?",
            },
            -- TODO: j for journal?
        },
    },
}
