function set_mappings(client, buffer)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [k] - previous", buffer = buffer })
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "[D]iagnostic [j] - next", buffer = buffer })
    vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "[D]iagnostic [O]pen", buffer = buffer })
    vim.keymap.set({ "n", "v" }, "<leader>rf", vim.lsp.buf.code_action, { desc = "[R]e[F]actor (code action)", buffer = buffer })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition", buffer = buffer })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame", buffer = buffer })
    vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, { desc = "[F]or[M]at", buffer = buffer })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "K - show info, help", buffer = buffer })
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

function setup_servers(lsp)
    local lsp = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = { "html", "cssls", "tsserver", "pyright", "angularls" }
    local default_config = {
        capabilities = capabilities,
        on_attach = set_mappings,
    }
    for _, server in ipairs(servers) do
        lsp[server].setup(default_config)
    end

    local node_modules_path = os.getenv("APPDATA") .. "/npm/node_modules/"
    local cmd = { "ngserver", "--stdio", "--tsProbeLocations", node_modules_path , "--ngProbeLocations", node_modules_path }
    lsp.angularls.setup({
      cmd = cmd,
      on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
      end,
    })
    lsp.omnisharp.setup({
        cmd = { "dotnet", os.getenv("LOCALAPPDATA") .. "/omnisharp/OmniSharp.dll" },
        handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        enable_import_completion = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        capabilities = capabilities,
        on_attach = function(client, buffer) 
            set_mappings(client, buffer)
        end,
    })
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
        "Issafalcon/lsp-overloads.nvim",
    },
    config = setup_servers,
}
