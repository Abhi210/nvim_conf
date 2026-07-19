return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup({
            -- Other options
            theme = "kanagawa",
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
        vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = 'Continue Debugging' })
        vim.keymap.set("n", "<leader>dn", function() dap.step_over() end, { desc = 'Step Over' })
        vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = 'Step Into' })
        vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = 'Step Out' })
        vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = 'Toggle Debug REPL' })
        vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = 'Run Last Debug' })
        vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = 'Toggle Debug UI' })
    end,
}