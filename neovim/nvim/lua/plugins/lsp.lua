local function set_mappings_on_attach(client, buffer)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [k] - previous", buffer = buffer })
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "[D]iagnostic [j] - next", buffer = buffer })
    vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "[D]iagnostic [O]pen", buffer = buffer })
    vim.keymap.set({ "n", "v" }, "<leader>rf", vim.lsp.buf.code_action, { desc = "[R]e[F]actor (code action)", buffer = buffer })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition", buffer = buffer })
    vim.keymap.set("n", "<leader>gtd", vim.lsp.buf.type_definition, { desc = "[G]o to [T]ype [D]efinition", buffer = buffer })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame", buffer = buffer })
    if client.server_capabilities.signatureHelpProvider then
        require("lsp-overloads").setup(client, {
            display_automatically = false,
            ui = {
                border = { " ", "", " ", " ", " ", "", " ", " " },
            },
        })
        vim.keymap.set({ "n", "i" }, "<C-n>", "<cmd>LspOverloadsSignature<CR>", { desc = "Ctrl + n - show signature help with overloads (if they are present)", buffer = buffer })
    else
        vim.keymap.set({ "n", "i" }, "<C-n>", vim.lsp.buf.signature_help, { desc = "Ctrl + n - show signature help", buffer = buffer })
    end
end

local function configure_diagnostic_highlights()
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
        underdotted = true,
    })
end

function on_attach(client, buffer)
    set_mappings_on_attach(client, buffer)
    configure_diagnostic_highlights()
end

local function configure_servers()
    local lsp = require("lspconfig")
    local schema_store = require("schemastore")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local node_modules_path = os.getenv("APPDATA") .. "/npm/node_modules/"
    local angularls_cmd = { "ngserver", "--stdio", "--tsProbeLocations", node_modules_path , "--ngProbeLocations", node_modules_path }
    local servers = { "html", "cssls", "ts_ls", "pyright", "emmet_language_server", "dockerls", "prismals", "gopls", "terraformls" }
    local default_config = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    for _, server in ipairs(servers) do
        lsp[server].setup(default_config)
    end

    lsp.angularls.setup({
        cmd = angularls_cmd,
        capabilities = capabilities,
        on_attach = on_attach,
        on_new_config = function(new_config)
            new_config.cmd = cmd
        end,
    })
    lsp.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            tailwindCSS = {
                emmetCompletions = true,
            },
        },
    })
    lsp.omnisharp.setup({
        cmd = { "dotnet", os.getenv("LOCALAPPDATA") .. "/omnisharp/OmniSharp.dll" },
        handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = true,
            },
            RoslynExtensionsOptions = {
                EnableAnalyzersSupport = true,
                EnableImportCompletion = true,
            },
        },
    })
    lsp.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            json = {
                schemas = schema_store.json.schemas(),
                validate = { enable = true },
            },
        },
    })
    lsp.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            yaml = {
                schemaStore = {
                    enable = false,
                    url = "",
                },
                schemas = schema_store.yaml.schemas(),
            },
        },
    })
    lsp.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, buffer)
            on_attach(client, buffer)
            vim.keymap.set("n", "<leader>lf", "<CMD>EslintFixAll<CR>", { desc = "Es[L]int [F]ix All", buffer = buffer })
        end,
    })
end

local function config()
    vim.keymap.set("n", "<leader>oli", "<CMD>LspInfo<CR>", { desc = "[O]ther: [L]SP [I]nfo" })
    vim.keymap.set("n", "<leader>olr", "<CMD>LspRestart<CR>", { desc = "[O]ther: [L]SP [R]estart" })
    configure_servers()
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
        "Issafalcon/lsp-overloads.nvim",
        "b0o/SchemaStore.nvim",
    },
    config = config,
}
