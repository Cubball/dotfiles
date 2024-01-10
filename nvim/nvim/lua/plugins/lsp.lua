function set_mappings()
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [k] - previous" })
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "[D]iagnostic [j] - next" })
    vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "[D]iagnostic [O]pen" })
    vim.keymap.set({ "n", "v" }, "<leader>rf", vim.lsp.buf.code_action, { desc = "[R]e[F]actor (code action)" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame" })
    vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, { desc = "[F]or[M]at" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "K - show info, help" })
end

function set_signature_help_mapping(client)
    if client.server_capabilities.signatureHelpProvider then
        require("lsp-overloads").setup(client, {
            display_automatically = false,
            ui = {
                border = { " ", "", " ", " ", " ", "", " ", " " },
            },
        })
        vim.keymap.set({ "n", "i" }, "<C-n>", "<cmd>LspOverloadsSignature<CR>", { desc = "Ctrl + n - show signature help with overloads (if they are present)" })
    else
        vim.keymap.set({ "n", "i" }, "<C-n>", vim.lsp.buf.signature_help, { desc = "Ctrl + n - show signature help"})
    end
end

function c_sharp_highlighting()
    vim.api.nvim_set_hl(0, "@lsp.type.namespace_name", { link = "@namespace" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter_name", { link = "@parameter" })
    vim.api.nvim_set_hl(0, "@lsp.type.local_name", { link = "@parameter" })
    vim.api.nvim_set_hl(0, "@lsp.type.class_name", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.struct_name", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.enum_name", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.delegate_name", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.interface_name", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.type_parameter_name", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.method_name", { link = "@method" })
    vim.api.nvim_set_hl(0, "@lsp.type.field_name", { link = "@field" })
    vim.api.nvim_set_hl(0, "@lsp.type.property_name", { link = "@field" })
end

function c_sharp_tokens_fix(client)
    if client.name == "omnisharp" then
        client.server_capabilities.semanticTokensProvider = {
            full = vim.empty_dict(),
            legend = {
                tokenModifiers = { "static_symbol" },
                tokenTypes = {
                    "comment",
                    "excluded_code",
                    "identifier",
                    "keyword",
                    "keyword_control",
                    "number",
                    "operator",
                    "operator_overloaded",
                    "preprocessor_keyword",
                    "string",
                    "whitespace",
                    "text",
                    "static_symbol",
                    "preprocessor_text",
                    "punctuation",
                    "string_verbatim",
                    "string_escape_character",
                    "class_name",
                    "delegate_name",
                    "enum_name",
                    "interface_name",
                    "module_name",
                    "struct_name",
                    "type_parameter_name",
                    "field_name",
                    "enum_member_name",
                    "constant_name",
                    "local_name",
                    "parameter_name",
                    "method_name",
                    "extension_method_name",
                    "property_name",
                    "event_name",
                    "namespace_name",
                    "label_name",
                    "xml_doc_comment_attribute_name",
                    "xml_doc_comment_attribute_quotes",
                    "xml_doc_comment_attribute_value",
                    "xml_doc_comment_cdata_section",
                    "xml_doc_comment_comment",
                    "xml_doc_comment_delimiter",
                    "xml_doc_comment_entity_reference",
                    "xml_doc_comment_name",
                    "xml_doc_comment_processing_instruction",
                    "xml_doc_comment_text",
                    "xml_literal_attribute_name",
                    "xml_literal_attribute_quotes",
                    "xml_literal_attribute_value",
                    "xml_literal_cdata_section",
                    "xml_literal_comment",
                    "xml_literal_delimiter",
                    "xml_literal_embedded_expression",
                    "xml_literal_entity_reference",
                    "xml_literal_name",
                    "xml_literal_processing_instruction",
                    "xml_literal_text",
                    "regex_comment",
                    "regex_character_class",
                    "regex_anchor",
                    "regex_quantifier",
                    "regex_grouping",
                    "regex_alternation",
                    "regex_text",
                    "regex_self_escaped_character",
                    "regex_other_escape",
                },
            },
            range = true,
        }
    end
end

function setup_servers(lsp)
    local local_app_data = os.getenv("LOCALAPPDATA")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lsp.html.setup({
        capabilities = capabilities,
    })
    lsp.cssls.setup({
        capabilities = capabilities,
    })

    lsp.tsserver.setup({
        on_attach = function(client, _)
            set_signature_help_mapping(client)
        end,
    })

    lsp.omnisharp.setup({
        cmd = { "dotnet", local_app_data .. "/omnisharp/OmniSharp.dll" },
        handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        enable_import_completion = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        on_attach = function(client, buffer) 
            c_sharp_highlighting()
            c_sharp_tokens_fix(client)
            set_signature_help_mapping(client)
        end,
    })

    -- local configs = require("lspconfig.configs")
    -- if not configs.rzls then
    --     configs.rzls = {
    --         default_config = {
    --             cmd = { local_app_data .. "/rzls/rzls.exe" },
    --             root_dir = lsp.util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json"),
    --             filetypes = { "cshtml" },
    --         },
    --     }
    -- end
    --
    -- lsp.rzls.setup({})
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
        "Issafalcon/lsp-overloads.nvim",
    },
    config = function()
        set_mappings()
        local lsp = require("lspconfig")
        setup_servers(lsp)
    end,
}
