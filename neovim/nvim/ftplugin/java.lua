local jdtls_path = os.getenv("LOCALAPPDATA") .. "/jdtls/bin/jdtls.bat"
local config = {
    cmd = { jdtls_path },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)

local jdtls_on_attach_group = vim.api.nvim_create_augroup("jdtls_on_attach", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "jdtls" then
            on_attach(client, bufnr)
        end
    end,
    group = jdtls_on_attach_group,
})
