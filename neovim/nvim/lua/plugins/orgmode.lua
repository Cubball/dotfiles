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
        org_deadline_warning_days = 5,
        org_blank_before_new_entry = {
            heading = false,
            plain_list_item = false,
        },
        org_todo_keywords = { "TODO(t)", "NEXT(n)", "|", "DONE(d)" },
        org_use_tag_inheritance = false,
        org_use_property_inheritance = false,
        org_agenda_show_future_repeats = false,
        org_agenda_span = "day",
        win_split_mode = "vertical",
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
            o = {
                description = "Other",
                template = "* %?",
            },
            b = {
                description = "Buy something",
                template = "* TODO %?       :BUY:",
            },
        },
        org_agenda_custom_commands = {
            -- TODO: add more
            b = {
                description = "Stuff to buy",
                types = {
                    {
                        type = "tags",
                        match = "BUY",
                        org_agenda_overriding_header = "Things I need to buy",
                    },
                },
            },
        },
    },
}
