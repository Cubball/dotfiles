local local_app_data = os.getenv("LOCALAPPDATA")
function setup_c_sharp(dap)
    dap.adapters.netcoredbg = {
        type = "executable",
        command = local_app_data .. "/netcoredbg/netcoredbg.exe",
        args = {"--interpreter=vscode"}
    }

    dap.configurations.cs = {
        {
            type = "netcoredbg",
            name = ".NET - launch",
            request = "launch",
            justMyCode = false,
            program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end,
        },
        {
            type = "netcoredbg",
            name = ".NET - attach",
            request = "attach",
            justMyCode = false,
            program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end,
            processId = function()
                return vim.fn.input("Process ID: ")
            end,
        },
    }
end

function setup_c_and_cpp(dap)
    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = local_app_data .. "/codelldb/extension/adapter/codelldb.exe",
            args = {"--port", "${port}"},
            -- On windows you may have to uncomment this:
            -- detached = false,
        }
    }

    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }

    dap.configurations.c = dap.configurations.cpp
end

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
            config = function()
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end,
        },
    },
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "F5 - start debugging or continue session" },
        { "<S-F5>", function() require("dap").terminate() end, desc = "Shift + F5 - terminate debugging session" },
        { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "F9 - toggle breakpoint" },
        { "<C-F9>", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Ctrl + F9 - set conditional breakpoint" },
        { "<S-F9>", function() require("dap").clear_breakpoints() end, desc = "Shift + F9 - clear all of the breakpoints" },
        { "<F10>", function() require("dap").step_over() end, desc = "F10 - step over" },
        { "<F11>", function() require("dap").step_into() end, desc = "F11 - step into" },
        { "<F12>", function() require("dap").step_out() end, desc = "F12 - step out" },
    },
    config = function()
        vim.fn.sign_define("DapBreakpoint", { text="🛑", texthl="", linehl="", numhl="" })
        vim.fn.sign_define("DapBreakpointRejected", { text="❌", texthl="", linehl="", numhl="" })
        vim.fn.sign_define("DapBreakpointCondition", { text="❓", texthl="", linehl="", numhl="" })
        local dap = require("dap")
        setup_c_sharp(dap)
        setup_c_and_cpp(dap)
    end
}
